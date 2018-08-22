class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
  # include UsersHelper

  def index
    @users = User.all
  end

  def new
    @user = User.new
    # @user.sf_favs.build
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
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      if @user.valid?
        @user = User.find(params[:id]) 
        @user.update(user_params)
        redirect_to user_path(@user)  
      else
        render :edit
      end
  end

  # Namespace destroy
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :fav_lits, :fav_films, :fav_games)
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end


      # @pledges = Pledge.where(:user_id == @user.id)
      # params[:user][:sf_favs_attributes][:fav_lits] = "(left blank)"
      # params[:user][:sf_favs_attributes][:fav_films] = "(left blank)"
      # params[:user][:sf_favs_attributes][:fav_games] = "(left blank)"
      # def new
      #   @user = User.new
      #   # @user.sf_favs.build
      # end
        # if params[:user][:sf_favs_attributes][:fav_lits] == nil && params[:user][:sf_favs_attributes][:fav_films] == nil && params[:user][:sf_favs_attributes][:fav_games] == nil

    # if params[:user][:sf_favs_attributes][:fav_lits] == "" || params[:user][:sf_favs_attributes][:fav_films] == "" || params[:user][:sf_favs_attributes][:fav_games] == ""
    # if params[:user][:sf_favs_attributes][:fav_lits] == "left blank" && params[:user][:sf_favs_attributes][:fav_films] == "left blank" && params[:user][:sf_favs_attributes][:fav_games] == "left blank"

    #   # params[:user][:sf_favs_attributes][:fav_lits] = "(left blank)"
    #   # params[:user][:sf_favs_attributes][:fav_films] = "(left blank)"
    #   # params[:user][:sf_favs_attributes][:fav_games] = "(left blank)"  
    #   @user = User.update(user_params_no_sf_favs)
    #   redirect_to user_path(@user)  
    # else
  # def user_params_no_sf_favs
  #   params.require(:user).permit(:name, :email, :password, sf_favs_attributes: [fav_lits: "left blank", fav_films: "left blank", fav_games: "left blank"])
  # end

  # def user_params_no_sf_favs_on_edit
  #   params.require(:user).permit(:name, :email, :password)
  # end


