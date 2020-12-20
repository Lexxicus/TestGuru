class ApplicationMailer < ActionMailer::Base
  default from: %("TestBudu" <mail@testbudu.com>)
  layout 'mailer'
end
