FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user1#{n}@gmail.com" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:last_name) { |n| "Smith#{n}" }
  end
end

FactoryGirl.define do
  factory :microhood do
    user
    neighborhood
    sequence(:street) { |n| "#{n} Main St" }
    sequence(:zip) { |n| "12433" }
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
    user
    microhood
    safety_rating 4
    schools_rating 5
    food_entertainment 4
    public_transport 4
    sequence(:title) { |n| "This awesome review #{n}" }
    sequence(:body) { |n| "Check it out guys! I love this microhood so much!!!!!!!!!!!#{n}" }
  end
end
