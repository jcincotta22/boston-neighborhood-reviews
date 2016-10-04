require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name "Frank"
    last_name "LaNasa"
    sequence(:email) { |n| "user#{n}@gmail.com"}
    sequence(:password) { |n| "password#{n}!"}
  end
end
