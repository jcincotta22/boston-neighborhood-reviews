class Review < ActiveRecord::Base
  validates :rating, length: { in: 0..5 }, presence: true
  validates :rating, format: { with: /^[+]?[1-9]\d{0,2}(\.\d)?$/ }
  validates :safety_rating, length: { in: 0..5 }, numericality: { only_integer: true }, presence: true
  validates :schools_rating, length: { in: 0..5 }, numericality: { only_integer: true }, presence: true
  validates :food_entertainment, length: { in: 0..5 }, numericality: { only_integer: true }, presence: true
  validates :public_transport, length: { in: 0..5 }, numericality: { only_integer: true }, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :body, presence: true, length: { minimum: 50 }

  belongs_to :user
  belongs_to :microhood
end
