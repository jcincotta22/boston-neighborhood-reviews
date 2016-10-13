# README
![Build Status](https://codeship.com/projects/6c7846b0-6ba7-0134-66a1-2e8398cca30e/status?branch=master)
![Code Climate](https://codeclimate.com/github/jcincotta22/boston-neighborhood-reviews.png)
![Coverage Status](https://coveralls.io/repos/jcincotta22/boston-neighborhood-reviews/badge.png)

Title:
Boston Neighborhood Reviews

Authors (Our-Awesome-Group):
Jeff Cincotta, Frank LaNasa, Marcus Richard, Tommy Carrington


Description:
We at Our-Awesome-Group feel that city lines alone are not enough to differentiate and describe the many distinct cultural hubs that make up Boston.  For example, two people might live in Somerville (let's say one is near Davis Square, and the other near Sullivan Square).  Though they technically live in the same city, their neighborhoods have different qualities.  To address this, we've made an app that lets people define and review subsets of existing neighborhoods (we call these "microhoods").  You can create your own microhood, complete with ratings for things such as: safety, quality of schools, accessibility, convenience of public transit, food, drink, and entertainment.


Installation and Setup:
Navigate to a directory where you want this repo to be cloned into.  Use this command:
git clone https://github.com/jcincotta22/boston-neighborhood-reviews.git
You'll want to run the following commands in the terminal to set up your database:
rake db:create
rake db:migrate
rake db:seed
rake db:test:prepare

Files will be uploaded using CarrierWave

You'll need to incorporate a cloud-based storage service (like AWS) to store user profile information (such as profile picture).  The .gitignore file is already set up to ignore the .env file.  You'll want to put in (complete with your own values): COVERALLS_REPO_TOKEN, AWS_SECRET_ACCESS_KEY, AWS_KEY_ID, BUCKET

To make sure you have all the necessary gems, run:
gem install bundler
bundle

It is not uncommon for users to have configuration issues with Capybara-webkit.  To resolve these issues, this guide is a great resource: https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#xcode-80

User authentication and authorization is done using the devise gem:
bundle && rails generate devise:install && rails generate devise:views
For a comprehensive guide to devise, https://github.com/plataformatec/devise

An email client will also need to be set up.  We recommend using Action Mailer.
To work with the app locally, you'll want to start a rails server with this command in the terminal:
rails s

and visit http://localhost:3000/ once the server is running.  To use our deployed app, go to http://boston-neighborhoods-reviews.herokuapp.com/


Features and Technologies:
Registration and login.  These can be found at the top right of the main page.  Authentication was implemented using the devise gem.

<!-- add later in rspec mailer test test WIP:
first_name = microhood.reviews.last.microhood.user.first_name
expect(last_email.to).to eq([user.email])
expect(mail.body.encoded).to match("Hello #{first_name}, #{microhood.name} was just reviewed!") -->
