ActionMailer::Base.delivery_method= :smtp
ActionMailer::Base.smtp_settings = {
  :address => 'stmp.sendgrid.net',
  :port => '587',
  :authentication => :plain,
  :user_name => 'app94536235@heroku.com',
  :password => 'oueitqnv5804',
  :domain => 'heroku.com',
  :enable_starttls_auto => true
}
