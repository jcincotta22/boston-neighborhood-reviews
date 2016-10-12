class Vote < ActiveRecord::Base
  validates :value, numericality: {greater_than_or_equal_to: -1 }
  validates :value, numericality: {less_than_or_equal_to: 1 }
  validates_uniqueness_of :user_id, scope: :review_id
end
