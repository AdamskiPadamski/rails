class ObservationsController < ApplicationController
  
  def new
    @observation = Observation.new
  end
  
  def create
    ap = add_anime_params
    if Anime.find_by(title:ap[:anime_id]).nil?
      Anime.create(title:ap[:anime_id])
    end
    
    ap[:anime_id] = Anime.find_by(title:ap[:anime_id]).id
    ap[:user_id] = session[:user_id]
    Observation.create(ap)
    redirect_to User.find_by(session[:user_id])
  end
  
  private
  
  def add_anime_params
    params.require(:observation).permit(:anime_id,:rating,:review)
  end
  
end