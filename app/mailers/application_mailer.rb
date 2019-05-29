class ApplicationMailer < ActionMailer::Base
  default from:     "メールテスト運営局",
          bcc:      "saltynem99@gmail.com",
          reply_to: "sample+reply@gmail.com"
  layout 'mailer'
  # layout 'mailer'
end
