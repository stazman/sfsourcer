class LitFanGenresController < ApplicationController

  def index
    @lit_fan_genres = LitFanGenre.new(params[:id])  
  end
    
  def show
    @lit_fan_genre = LitFanGenre.find(params[:id])
  end
end
