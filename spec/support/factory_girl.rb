require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gmail.com"}
    sequence(:password) { |n| "password#{n}!"}
  end
end
