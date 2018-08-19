class LitFanGenresController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

  def index
    @lit_fan_genres = LitFanGenre.all  
  end
  
    # namespace

  def new
    @lit_fan_genre = LitFanGenre.new(params[:id])  
  end

    # namespace

  def create
    @lit_fan_genre = LitFanGenre.new(params[:id])  
    @lit_fan_genre = LitFanGenre.create(lit_fan_genre_params)
    redirect_to lit_fan_genres_path
  end

  def show
    @lit_fan_genre = LitFanGenre.find(params[:id])
  end

  # namespace
  def edit
    @lit_fan_genre = LitFanGenre.find(params[:id])
  end

    # namespace

  def update
    @lit_fan_genre = LitFanGenre.find(params[:id])
    @lit_fan_genres = LitFanGenre.update(lit_fan_genre_params)
    redirect_to lit_fan_genres_path
  end
  
  # namespace
  def destroy
    @lit_fan_genre = LitFanGenre.find(params[:id])
    @lit_fan_genre.destroy
    flash[:notice] = "Genre deleted."
    redirect_to lit_fan_genres_path
  end

  private

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end

  def lit_fan_genre_params
    params.require(:lit_fan_genre).permit(:name)
  end
end

end
