# frozen_string_literal: true

# Date Range Validation
#
# Allow: YYYY-YYYY, *-YYYY, YYYY-*
# @TODO: allow nil value
class Document
  # DateRangeValidator
  class DateRangeValidator < ActiveModel::Validator
    def validate(record)
      valid_date_ranges = true
      record.send(GEOMG.FIELDS.B1G_DATE_RANGE).each do |date_range|
        if date_range.blank?
          valid_date_ranges = true
        elsif date_range[/[a-zA-Z]/]
          record.errors.add(GEOMG.FIELDS.B1G_DATE_RANGE, 'invalid date range present - only numbers allowed')
          valid_date_ranges = false
        elsif date_range[/\d{4}|\*-\d{4}|\*/]
          valid_date_ranges = true
        else
          record.errors.add(GEOMG.FIELDS.B1G_DATE_RANGE, 'invalid date range present')
          valid_date_ranges = false
        end
      end
      valid_date_ranges
    end
  end
end
