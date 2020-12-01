# frozen_string_literal: true

# @TODO
# - Centroids
# - GeoNames
module Geomg
  module_function

  def field_mappings_gblv1
    {
      'dc_title_s': {
        destination: 'dc_title_s',
        delimited: false,
        transformation_method: nil
      },
      'alternativeTitle_sm': {
        destination: 'dct_alternativeTitle_sm',
        delimited: true,
        transformation_method: nil
      },
      'dct_alternativeTitle_sm': {
        destination: 'dct_alternativeTitle_sm',
        delimited: true,
        transformation_method: nil
      },
      'dc_description_s': {
        destination: 'dc_description_s',
        delimited: false,
        transformation_method: nil
      },
      'dc_language_s': {
        destination: 'dc_language_sm',
        delimited: true,
        transformation_method: nil
      },
      'dc_language_sm': {
        destination: 'dc_language_sm',
        delimited: true,
        transformation_method: nil
      },
      'dc_publisher_s': {
        destination: 'dc_publisher_sm',
        delimited: true,
        transformation_method: nil
      },
      'dc_publisher_sm': {
        destination: 'dc_publisher_sm',
        delimited: true,
        transformation_method: nil
      },
      'dc_creator_sm': {
        destination: 'dc_creator_sm',
        delimited: true,
        transformation_method: nil
      },
      'b1g_genre_sm': {
        destination: 'b1g_genre_sm',
        delimited: true,
        transformation_method: nil
      },
      'dc_subject_sm': {
        destination: 'dc_subject_sm',
        delimited: true,
        transformation_method: nil
      },
      'b1g_keyword_sm': {
        destination: 'b1g_keyword_sm',
        delimited: true,
        transformation_method: nil
      },
      'dct_issued_s': {
        destination: 'dct_issued_s',
        delimited: false,
        transformation_method: nil
      },
      'dct_temporal_sm': {
        destination: 'dct_temporal_sm',
        delimited: true,
        transformation_method: nil
      },
      'b1g_date_range_drsim': {
        destination: 'b1g_date_range_drsim',
        delimited: true,
        transformation_method: nil
      },
      'dct_spatial_sm': {
        destination: 'dct_spatial_sm',
        delimited: true,
        transformation_method: nil
      },
      'b1g_geonames_sm': {
        destination: 'b1g_geonames_sm',
        delimited: true,
        transformation_method: nil
      },
      'solr_geom': {
        destination: 'solr_geom',
        delimited: false,
        transformation_method: nil
      },
      'dc_format_s': {
        destination: 'dc_format_s',
        delimited: false,
        transformation_method: nil
      },
      'dc_type_s': {
        destination: 'dc_type_sm',
        delimited: true,
        transformation_method: nil
      },
      'dc_type_sm': {
        destination: 'dc_type_sm',
        delimited: true,
        transformation_method: nil
      },
      'layer_geom_type_s': {
        destination: 'layer_geom_type_s',
        delimited: false,
        transformation_method: nil
      },
      'layer_id_s': {
        destination: 'layer_id_s',
        delimited: false,
        transformation_method: nil
      },
      'dct_references_s': {
        'destination': 'dct_references_s',
        'delimited': false,
        'transformation_method': 'build_dct_references'
      },
      'b1g_image_ss': {
        destination: 'b1g_image_ss',
        delimited: false,
        transformation_method: nil
      },
      'dc_identifier_s': {
        destination: 'dc_identifier_s',
        delimited: false,
        transformation_method: nil
      },
      'layer_slug_s': {
        destination: 'layer_slug_s',
        delimited: false,
        transformation_method: nil
      },
      'dct_provenance_s': {
        destination: 'dct_provenance_s',
        delimited: false,
        transformation_method: nil
      },
      'b1g_code_s': {
        destination: 'b1g_code_s',
        delimited: false,
        transformation_method: nil
      },
      'dct_isPartOf_sm': {
        destination: 'dct_isPartOf_sm',
        delimited: true,
        transformation_method: nil
      },
      'dc_source_sm': {
        destination: 'dc_source_sm',
        delimited: true,
        transformation_method: nil
      },
      'b1g_status_s': {
        destination: 'b1g_status_s',
        delimited: false,
        transformation_method: nil
      },
      'dct_accrualMethod_s': {
        destination: 'dct_accrualMethod_s',
        delimited: false,
        transformation_method: nil
      },
      'Accrual Periodicity': {
        destination: 'dct_accrualPeriodicity_s',
        delimited: false,
        transformation_method: nil
      },
      'b1g_dateAccessioned_s': {
        destination: 'b1g_dateAccessioned_s',
        delimited: false,
        transformation_method: nil
      },
      'b1g_dateRetired_s': {
        destination: 'b1g_dateRetired_s',
        delimited: false,
        transformation_method: nil
      },
      'dc_rights_s': {
        destination: 'dc_rights_s',
        delimited: false,
        transformation_method: nil
      },
      'dct_accessRights_sm': {
        destination: 'dct_accessRights_sm',
        delimited: true,
        transformation_method: nil
      },
      'suppressed_b': {
        destination: 'suppressed_b',
        delimited: false,
        transformation_method: nil
      },
      'b1g_child_record_b': {
        destination: 'b1g_child_record_b',
        delimited: false,
        transformation_method: nil
      },
      'solr_year_i': {
        destination: 'solr_year_i',
        delimited: false,
        transformation_method: nil
      },
      'layer_modified_dt': {
        destination: 'layer_modified_dt',
        delimited: false,
        transformation_method: nil
      },
      'dct_mediator_sm': {
        destination: 'dct_mediator_sm',
        delimited: false,
        transformation_method: nil
      },
      'score': {
        destination: 'Discard',
        delimited: false,
        transformation_method: nil
      },
      'cugir_category_sm': {
        destination: 'cugir_category_sm',
        delimited: false,
        transformation_method: nil
      },
      'solr_bboxtype': {
        destination: 'Discard',
        delimited: false,
        transformation_method: nil
      },
      'b1g_access_s': {
        destination: 'b1g_access_s',
        delimited: false,
        transformation_method: nil
      },
      'geoblacklight_version': {
        destination: 'Discard',
        delimited: false,
        transformation_method: nil
      },
      'nyu_addl_dspace_s': {
        destination: 'nyu_addl_dspace_s',
        delimited: false,
        transformation_method: nil
      },
      'b1g_collection_sm': {
        destination: 'b1g_collection_sm',
        delimited: false,
        transformation_method: nil
      },
      'georss_polygon_s': {
        destination: 'georss_polygon_s',
        delimited: false,
        transformation_method: nil
      },
      'dct_accrual_sm': {
        destination: 'dct_accrual_sm',
        delimited: false,
        transformation_method: nil
      },
      'solr_bboxtype__maxX': {
        destination: 'Discard',
        delimited: false,
        transformation_method: nil
      },
      'solr_bboxtype__minX': {
        destination: 'Discard',
        delimited: false,
        transformation_method: nil
      },
      'solr_bboxtype__maxY': {
        destination: 'Discard',
        delimited: false,
        transformation_method: nil
      },
      'solr_bboxtype__minY': {
        destination: 'Discard',
        delimited: false,
        transformation_method: nil
      },
      'call_number_s': {
        destination: 'call_number_s',
        delimited: false,
        transformation_method: nil
      },
      'timestamp': {
        destination: 'Discard',
        delimited: false,
        transformation_method: nil
      },
      'b1g_centroid_ss': {
        destination: 'Discard',
        delimited: false,
        transformation_method: nil
      },
      'cugir_addl_downloads_s': {
        destination: 'cugir_addl_downloads_s',
        delimited: false,
        transformation_method: nil
      },
      'cugir_filesize_s': {
        destination: 'cugir_filesize_s',
        delimited: false,
        transformation_method: nil
      },
      '_version_': {
        destination: 'Discard',
        delimited: false,
        transformation_method: nil
      },
      'stanford_rights_metadata_s': {
        destination: 'stanford_rights_metadata_s',
        delimited: false,
        transformation_method: nil
      }
    }
  end

  def uri_2_category_references_mappings
    ActiveSupport::HashWithIndifferentAccess.new({
      'http://www.opengis.net/def/serviceType/ogc/wcs': 'wcs',
      'http://www.opengis.net/def/serviceType/ogc/wms': 'wms',
      'http://www.opengis.net/def/serviceType/ogc/wfs': 'wfs',
      'http://iiif.io/api/image': 'iiif_image',
      'http://iiif.io/api/presentation#manifest': 'iiif_manifest',
      'http://schema.org/image': 'image',
      'http://schema.org/downloadUrl': 'download',
      'http://schema.org/thumbnailUrl': 'thumbnail',
      'http://lccn.loc.gov/sh85035852': 'documentation_download',
      'http://schema.org/url': 'documentation_external',
      'http://www.isotc211.org/schemas/2005/gmd/': 'metadata_iso',
      'http://www.opengis.net/cat/csw/csdgm': 'metadata_fgdc',
      'http://www.loc.gov/mods/v3': 'metadata_mods',
      'http://www.w3.org/1999/xhtml': 'metadata_html',
      'urn:x-esri:serviceType:ArcGIS#FeatureLayer': 'arcgis_feature_layer',
      'urn:x-esri:serviceType:ArcGIS#TiledMapLayer': 'arcgis_tiled_map_layer',
      'urn:x-esri:serviceType:ArcGIS#DynamicMapLayer': 'arcgis_dynamic_map_layer',
      'urn:x-esri:serviceType:ArcGIS#ImageMapLayer': 'arcgis_image_map_layer',
      'http://schema.org/DownloadAction': 'harvard',
      'https://openindexmaps.org': 'open_index_map',
      'https://oembed.com': 'oembed'
    })
  end
end