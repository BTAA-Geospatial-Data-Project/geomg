# frozen_string_literal: true

# To deliver this notification:
#
# ExportNotification.with(post: @post).deliver_later(current_user)
# ExportNotification.with(post: @post).deliver(current_user)

# ExportNotification
class ExportNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :message

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  #   post_path(params[:post])
  # end
end
