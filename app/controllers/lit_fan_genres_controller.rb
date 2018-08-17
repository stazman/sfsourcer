class LitFanGenresController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

  def index
    @lit_fan_genres = LitFanGenre.new(params[:id])  
  end
    
  def show
    @lit_fan_genre = LitFanGenre.find(params[:id])
  end

  private

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end
