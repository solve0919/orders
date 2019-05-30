class ApplicationMailer < ActionMailer::Base
  default from:     "メールテスト運営局",
          bcc:      "saltynem99@gmail.com",
          reply_to: "saltynem99@gmail.com"
  layout 'mailer'
end
