# README
![Build Status](https://codeship.com/projects/6c7846b0-6ba7-0134-66a1-2e8398cca30e/status?branch=master)
![Code Climate](https://codeclimate.com/github/jcincotta22/boston-neighborhood-reviews.png)
![Coverage Status](https://coveralls.io/repos/jcincotta22/boston-neighborhood-reviews/badge.png)

Title:
Boston Neighborhood Reviews


Description:
We feel that city lines alone  are not enough to differentiate and describe the many distinct cultural hubs that make up Boston.  For example, two people might live in Somerville (let's say one is near Davis Square, and the other near Sullivan Square).  Though they technically live in the same city, their neighborhoods have different qualities.  To address this, we've made an app that lets people define and review subsets of existing neighborhoods (we call these "microhoods").  You can create your own microhood, complete with ratings for things such as: safety, quality of schools, accessibility, convenience of public transit, food, drink, and entertainment.


Installation and Setup:
Navigate to a directory where you want this repo to be cloned into.  Use this command:
git clone https://github.com/jcincotta22/boston-neighborhood-reviews.git
You'll want to run the following commands in the terminal to set up your database.

rake db:create
rake db:migrate
rake db:test:prepare

You'll need to incorporate a cloud-based storage service (like AWS) to store user profile information (such as profile picture).

An email client will also need to be set up.  We recommend using Action Mailer.
To work with the app locally, you'll want to start a rails server with this command in the terminal:

rails s

and visit http://localhost:3000/ once the server is running.  To use our deployed app, go to http://boston-neighborhoods-reviews.herokuapp.com/



add later in rspec mailer test test WIP:
first_name = microhood.reviews.last.microhood.user.first_name
expect(last_email.to).to eq([user.email])
expect(mail.body.encoded).to match("Hello #{first_name}, #{microhood.name} was just reviewed!")
