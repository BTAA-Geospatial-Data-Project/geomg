# frozen_string_literal: true

# BlacklightApiFacets
class BlacklightApiFacets
  include HTTParty
  base_uri BLACKLIGHT_JSON_API_FACETS

  def initialize; end

  def fetch
    @fetch ||= self.class.get('/', query: {})
  end

  def facets
    fetch['included'].filter_map { |s| s if s['type'] == 'facet' }
  end
end
