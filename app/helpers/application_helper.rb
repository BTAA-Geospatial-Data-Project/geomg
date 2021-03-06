# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  include Pagy::Frontend

  # jbuilder helper
  def no_json_blanks(value)
    case value
    when String
      value.presence
    when Array
      value.join.blank? ? nil : value
    end
  end

  # qa (questioning_authoriry) gem oddly gives us no route helpers, so
  # let's make one ourselves, for it's current mount point, we can change
  # it if needed but at least it's DRY.
  def qa_search_vocab_path(vocab, subauthority = nil)
    path = "/authorities/search/#{CGI.escape vocab}"

    path += "/#{CGI.escape subauthority}" if subauthority

    path
  end

  def flash_class(level)
    alerts = {
      'notice' => 'alert alert-info',
      'success' => 'alert alert-success',
      'error' => 'alert alert-error',
      'alert' => 'alert alert-error'
    }
    alerts[level]
  end

  def b1g_institution_codes
    {
      '01' => 'Indiana University',
      '02' => 'University of Illinois Urbana-Champaign',
      '03' => 'University of Iowa',
      '04' => 'University of Maryland',
      '05' => 'University of Minnesota',
      '06' => 'Michigan State University',
      '07' => 'University of Michigan',
      '08' => 'Purdue University',
      '09' => 'Pennsylvania State University',
      '10' => 'University of Wisconsin-Madison',
      '11' => 'The Ohio State University',
      '12' => 'University of Chicago',
      '13' => 'University of Nebraska-Lincoln'
    }
  end

  def notifications_badge
    notifications_classes = ['badge']
    notifications_classes << 'badge-dark' if current_user.notifications.unread.empty?
    notifications_classes << 'badge-danger' if current_user.notifications.unread.size.positive?
    "<span class='#{notifications_classes.join(' ')}' id='notification-count'>#{current_user.notifications.unread.size}</span>"
  end
end
