class User < ActiveRecord::Base
  validates :user_name, presence: true
  validates :profile_pic_url, presence: true

  has_many :reviews
  has_many :microhoods
end
