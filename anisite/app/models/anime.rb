class Anime < ActiveRecord::Base
  
  validates :title, presence:true, uniqueness:true
  
  has_many :observations
  has_many :users, through: :observations
  
  def self.get_reviews(anime)
    return anime.observations.joins(:user).select(:username,:review).where.not(review:"")
  end
  
end
