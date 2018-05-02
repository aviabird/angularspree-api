class ApplicationMailer < ActionMailer::Base
    default from: ENV['MAIL_FROM']
    layout 'mailer'
  end
  