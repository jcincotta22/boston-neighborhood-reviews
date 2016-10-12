if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = { address: "localhost", port: 1025 }
else
  ActionMailer::Base.smtp_settings = {
    user_name: 'app57789087@heroku.com',
    password: ENV['SENDGRID_PW']
    domain: 'https://boston-neighborhoods-reviews.herokuapp.com/',
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }
end
