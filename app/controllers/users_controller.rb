class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
  # include UsersHelper

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.sf_favs.build
  end

  def create  
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
      @user = User.find(params[:id]) 
      # @pledges = Pledge.where(:user_id == @user.id)
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.update(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, sf_favs_attributes: [:id, :fav_lits, :fav_films, :fav_games], 
      fp_creator_ids:[],
      fp_creators_attributes:
      ["id",
      "name",
      "location",
      "creator_about",
      "creator_site",
      "instagram_url",
      "twitter_url",
      "facebook_url",
      "blog_url",
      "user_id"]
      )
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end