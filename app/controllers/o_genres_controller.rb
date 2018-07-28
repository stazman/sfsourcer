class OGenresController < ApplicationController
  before_action :require_login

  def index
    @o_genres = OGenre.all
  end
 
  def new
    @o_genre = OGenre.new
    # @o_genre.addresses.build
  end

  def create  
    @o_genre = OGenre.new(o_genre_params)
    if @o_genre.valid?
      @o_genre.save
      redirect_to o_genre_path(@o_genre)
    else
      render :new
    end
  end

  def show
      @o_genre = OGenre.find(params[:id]) 
      # @pledges = Pledge.where(:ls_genre_id == @o_genre.id)
  end

  def edit
      @o_genre = OGenre.find(params[:id])
  end

  def update
    @o_genre = OGenre.update(o_genre_params)
    @o_genre.save
    redirect_to o_genre_path(@o_genre)
  end

  private

  def o_genre_params
    params.require(:ls_genre).permit(:name)
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end
