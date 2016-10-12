class Microhood < ActiveRecord::Base
  validates :street, presence: true
  validates :zip, length: { is: 5 }, numericality: { only_integer: true }, allow_blank: true
  validates :description, length: { maximum: 100 }
  validates :name, presence: true
  has_many :reviews
  belongs_to :user
  belongs_to :neighborhood

  def self.search(search)
    if search
      where('street ILIKE ? OR name ILIKE ?', "%#{search}%", "%#{search}%").all
    else
      all
    end
  end
end
