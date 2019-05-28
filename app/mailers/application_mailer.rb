class ApplicationMailer < ActionMailer::Base
  default from:     "メールテスト運営局",
          bcc:      "saltynem99@gmail.com",
  layout 'mailer'
end
