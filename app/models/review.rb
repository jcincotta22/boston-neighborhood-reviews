class Review < ActiveRecord::Base
  validates :rating, length: { in: 0..5 }, allow_blank: true
  validates :rating, format: { with: /[+]?[0-5]{1}(\.\d)/ }, allow_blank: true
  validates :safety_rating, length: { in: 0..5 }, numericality: { only_integer: true }, presence: true
  validates :schools_rating, length: { in: 0..5 }, numericality: { only_integer: true }, presence: true
  validates :food_entertainment, length: { in: 0..5 }, numericality: { only_integer: true }, presence: true
  validates :public_transport, length: { in: 0..5 }, numericality: { only_integer: true }, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :body, presence: true, length: { minimum: 50 }
  validates :user, presence: { message: 'must be signed in'}
  belongs_to :user
  belongs_to :microhood

  after_create do |review|
    rating = ((safety_rating + schools_rating + food_entertainment + public_transport)/4.0).round(1)
    review.update_attribute(:rating, rating)
  end

  def alert_creator
    if save
      ReviewAlertMailer.new_review(self).deliver
      return true
    else
      return false
    end
  end
end
