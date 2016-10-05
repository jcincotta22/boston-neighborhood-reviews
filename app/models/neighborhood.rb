class Neighborhood < ActiveRecord::Base
  validates :name, presence: true
  has_many :microhoods
end
