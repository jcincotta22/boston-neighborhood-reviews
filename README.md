# README
![Build Status](https://codeship.com/projects/6c7846b0-6ba7-0134-66a1-2e8398cca30e/status?branch=master)
![Code Climate](https://codeclimate.com/github/jcincotta22/boston-neighborhood-reviews.png)
![Coverage Status](https://coveralls.io/repos/jcincotta22/boston-neighborhood-reviews/badge.png)

Title:
Boston Neighborhood Reviews

Authors:
Jeff Cincotta, Frank LaNasa, Marcus Richard, Tommy Carrington

Description:
We feel that city lines alone are not enough to differentiate and describe the many distinct cultural hubs that make up Boston.  For example, two people might live in Somerville (let's say one is near Davis Square, and the other near Sullivan Square).  Though they technically live in the same city, their neighborhoods have different qualities.  To address this, we've made an app that lets people define and review subsets of existing neighborhoods (we call these "microhoods").  You can create your own microhood, complete with ratings for things such as: safety, quality of schools, accessibility, convenience of public transit, food, drink, and entertainment.

Installation and Setup:
Navigate to a directory where you want this repo to be cloned into.  Use this command:
git clone https://github.com/jcincotta22/boston-neighborhood-reviews.git
You'll want to run the following commands in the terminal to set up your database in development:
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

An email client will also need to be set up. We recommend using SendGrid for production and mailcatcher for local.  When checking if mail on local is sent out, in terminal start up mailcatcher:
mailcatcher

To work with the app locally, you'll want to start a rails server with this command in the terminal:
rails s

and visit http://localhost:3000/ once the server is running.  To use our deployed app, go to http://boston-neighborhoods-reviews.herokuapp.com/

User Guide:
First, you'll need to register and login.  These items can be found at the top right of the main page.  Authentication was implemented using the devise gem. Once you're signed in, you need to create your first microhood. To do so, click on the 'Create and Review a New Microhood' button. There you will need to fill out the form, and when done click the 'Submit' button, which will create a flash message denoting success or failure. If successful, you will see a page called 'Reviews for Microhood'. There is a form for a new review. Once filled out, click 'Submit' and you will see another flash alert denoting the review was successfully added, and the review will show up on the page. You can then upvote or downvote the review, edit, or delete it. You can also create a new review using the same form. Clicking on 'Boston Microhoods' on the top will take you back to the home page. Use the search bar to find the microhood you want. In the event you are unhappy with our site, you have the option of cancelling your account by clicking on the 'Cancel' at the botton of the registration page.
