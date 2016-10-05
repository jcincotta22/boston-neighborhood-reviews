require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "auser#{n}@gmail.com" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:last_name) { |n| "Smith#{n}" }
  end
end

FactoryGirl.define do
  factory :microhood do
    user_id 1
    sequence(:street) { |n| "#{n} Main St" }
    sequence(:zip) { |n| "#{n}2433" }
    sequence(:name) { |n| "Downtown Area#{n}" }
  end
end

FactoryGirl.define do
  factory :neighborhood do
    sequence(:name) { |n| "West Roxbury #{n}" }
  end
end

FactoryGirl.define do
  factory :review do
    user_id 1
    microhood_id 1
    sequence(:rating) { |n| n + 0.5 }
    sequence(:safety_rating) { |n| n }
    sequence(:schools_rating) { |n| n }
    sequence(:food_entertainment) { |n| n }
    sequence(:public_transport) { |n| n }
    sequence(:title) { |n| "This awesome review #{n}" }
    sequence(:body) { |n| "OMG this review is off the hook! Check it out guys! I love this microhood so much!!!!!!!!!!!#{n}" }
  end
end
