class ApplicationMailer < ActionMailer::Base
  default from: "mailer@#{ENV['DOMAIN']}"
  layout 'mailer'
end
