class User < ActiveRecord::Base
  validates :email, presence:true
  validates :username, presence:true, uniqueness:true
  validates :password, length: { in: 8..72 }
  has_many :observations
  has_many :animes, through: :observations
  has_many :comments
  has_secure_password
end
