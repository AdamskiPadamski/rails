class Anime < ActiveRecord::Base
  
  validates :title, presence:true, uniqueness:true
  
  has_many :observations
  has_many :users, through: :observations
  
end
