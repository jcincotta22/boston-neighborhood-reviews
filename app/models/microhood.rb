class Microhood < ActiveRecord::Base
  validates :street, presence: true
  validates :zip, length: { is: 5 }, numericality: { only_integer: true }
  validates :description, length: { maximum: 100 }

  has_many :reviews
  belongs_to :user
  belongs_to :neighborhood
end
