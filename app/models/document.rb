# frozen_string_literal: true

# Document
class Document < Kithe::Work
  include AttrJson::Record::QueryScopes
  include ActiveModel::Validations

  attr_accessor :skip_callbacks

  has_paper_trail
  belongs_to :import, optional: true

  # Statesman
  has_many :document_transitions, foreign_key: 'kithe_model_id', autosave: false, dependent: :destroy, inverse_of: :document

  include Statesman::Adapters::ActiveRecordQueries[
    transition_class: DocumentTransition,
    initial_state: :draft
  ]

  def state_machine
    @state_machine ||= DocumentStateMachine.new(self, transition_class: DocumentTransition)
  end

  delegate :current_state, to: :state_machine

  before_save :transition_publication_state, unless: :skip_callbacks

  # Indexer
  self.kithe_indexable_mapper = DocumentIndexer.new

  # Validations
  validates :b1g_status_s, :dc_identifier_s, :dc_rights_s, :layer_geom_type_s, :layer_slug_s, presence: true

  # @TODO: Test for collection and restricted
  validates :dc_format_s, presence: true, unless: :a_collection_object?

  # Interactive Resouce
  # Restricted items!
  def a_collection_object?
    dc_type_sm.include?('Collection')
  end

  validates_with Document::DateRangeValidator
  validates_with Document::SolrGeomValidator

  # Form
  # Identification
  # - Descriptive
  attr_json GEOMG.FIELDS.TITLE, :string
  attr_json :dct_alternativeTitle_sm, :string, array: true, default: -> { [] }
  attr_json :dc_description_s, :text
  attr_json :dc_language_sm, :string, array: true, default: -> { [] }

  # - Credits
  attr_json :dc_creator_sm, :string, array: true, default: -> { [] }
  attr_json :dc_publisher_sm, :string, array: true, default: -> { [] }

  # - Categories
  attr_json :b1g_genre_sm, :string, array: true, default: -> { [] }
  attr_json :dc_subject_sm, :string, array: true, default: -> { [] }
  attr_json :b1g_keyword_sm, :string, array: true, default: -> { [] }

  # - Temporal
  attr_json :dct_issued_s, :string
  attr_json :dct_temporal_sm, :string, array: true, default: -> { [] }
  attr_json :b1g_date_range_drsim, :string, array: true, default: -> { [] }
  attr_json :solr_year_i, :integer

  # - Spatial
  attr_json :dct_spatial_sm, :string, array: true, default: -> { [] }
  attr_json :b1g_geonames_sm, :string, array: true, default: -> { [] }
  attr_json :solr_geom, :string
  attr_json :b1g_centroid_ss, :string

  # Distribution
  # - Object
  attr_json :dc_type_sm, :string, array: true, default: -> { [] }
  attr_json :layer_geom_type_s, :string
  attr_json :layer_id_s, :string
  attr_json :dc_format_s, :string

  # - Access Links
  # - Geospatial Web Services
  # - Images
  # - Metadata
  attr_json :dct_references_s, Document::Reference.to_type, array: true, default: -> { [] }
  attr_json :b1g_image_ss, :string

  # Administrative
  # - Codes
  attr_json :dc_identifier_s, :string
  attr_json :layer_slug_s, :string
  attr_json :dct_provenance_s, :string
  attr_json :b1g_code_s, :string
  attr_json :dct_isPartOf_sm, :string, array: true, default: -> { [] }
  attr_json :dc_source_sm, :string, array: true, default: -> { [] }

  # - Status
  attr_json :b1g_status_s, :string
  attr_json :dct_accrualMethod_s, :string
  attr_json :dct_accrualPeriodicity_s, :string
  attr_json :b1g_dateAccessioned_s, :string
  attr_json :b1g_dateRetired_s, :string

  # - Accessibility
  attr_json :dc_rights_s, :string
  attr_json :dct_accessRights_sm, :string, array: true, default: -> { [] }

  # @TODO: Why are booleans not passed in form params?
  attr_json :suppressed_b, :boolean
  attr_json :b1g_child_record_b, :boolean

  # Index Transformations - *_json functions
  def references_json
    references = {}
    dct_references_s.each { |ref| references[Document::Reference::REFERENCE_VALUES[ref.category.to_sym][:uri]] = ref.value }
    references.to_json
  end

  def access_json
    access = {}
    access_urls.each { |au| access[au.institution_code] = au.access_url }
    access.to_json
  end

  def layer_modified_dt
    updated_at&.utc&.iso8601
  end

  def date_range_json
    date_ranges = []
    b1g_date_range_drsim.each do |date_range|
      start_d, end_d = date_range.split('-')
      start_d = '*' if start_d == 'YYYY' || start_d.nil?
      end_d   = '*' if end_d == 'YYYY' || end_d.nil?
      date_ranges << "[#{start_d} TO #{end_d}]" if start_d.present?
    end
    date_ranges
  end

  def solr_year_json
    return nil if b1g_date_range_drsim.blank?

    start_d, _end_d = b1g_date_range_drsim.first.split('-')
    start_d if start_d.presence
  end

  # Export Transformations - to_*
  def to_csv
    attributes = Geomg.field_mappings_btaa

    attributes.map do |key, value|
      if value[:delimited]
        send(value[:destination]).join('|')
      elsif value[:destination] == 'solr_geom'
        solr_geom_to_csv(value[:destination])
      elsif value[:destination] == 'dct_references_s'
        dct_references_s_to_csv(key, value[:destination])
      else
        send(value[:destination])
      end
    end
  end

  def dct_references_s_to_csv(key, destination)
    send(destination).detect { |ref| ref.category == Geomg.dct_references_mappings[key] }.value
  rescue NoMethodError
    nil
  end

  def solr_geom_to_csv(destination)
    wsen_coordinates(send(destination))
  rescue NoMethodError
    nil
  end

  def current_version
    versions.last.index
  end

  # Institutional Access URLs
  def access_urls
    DocumentAccess.where(friendlier_id: friendlier_id).order(institution_code: :asc)
  end

  private

  # "ENVELOPE(W,E,N,S)" convert to "W,S,E,N"
  def wsen_coordinates(coords)
    # ex. ENVELOPE(-95.0379,-91.198,43.1373,40.6333)
    w, e, n, s = coords[/\((.*?)\)/, 1].split(',')
    "#{w},#{s},#{e},#{n}"
  end

  def transition_publication_state
    state_machine.transition_to!(publication_state.downcase) if publication_state_changed?
  end
end
