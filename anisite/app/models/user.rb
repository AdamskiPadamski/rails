class User < ActiveRecord::Base
  validates :email, presence:true
  validates :password, length: { in: 8..72 }
  has_many :observations
  has_many :animes, through: :observations
  has_secure_password
end
