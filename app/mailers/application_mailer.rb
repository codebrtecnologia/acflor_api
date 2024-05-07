class ApplicationMailer < ActionMailer::Base
  # default from: "from@example.com"
  default from: ENV.fetch('EMAIL_FROM')
  layout "mailer"
end
