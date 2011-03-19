class MessageMailer < ActionMailer::Base
  default :from => "support@wigdom.com"

  def notification(message)
    subject "Wigdom.com: New Message From Customer"
    body :message => message
    recipients "message@wigdom.com"
    from message.email
    content_type "text/html"
  end
end
