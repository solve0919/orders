class ApplicationMailer < ActionMailer::Base
  default from:     "メールテスト運営局",
          bcc:      "saltnem@yahoo.co.jp",
          reply_to: "saltnem@yahoo.co.jp"
  layout 'mailer'
end
