class User < ActiveRecord::Base
  validates :email, presence:true
  validates :password, length: { in: 8..72 }
  has_secure_password
end
