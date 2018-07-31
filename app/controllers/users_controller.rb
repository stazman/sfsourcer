class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
  include UsersHelper

  def index
    @users = User.all
  end

  # def addresses_index
  #   @user = User.find(params[:id])
  #   @addresses = @user.addresses
  #   render template: 'addresses/index'
  # end
 
  # def post
  #   @user = User.find(params[:id])
  #   @address = Address.find(params[:user_id])
  #   render template: 'addresses/show'
  # end

  def new
    @user = User.new
    @user.sf_favs.build(sf_fav_type: 'sf_lits')
    @user.sf_favs.build(sf_fav_type: 'sf_films')
    @user.sf_favs.build(sf_fav_type: 'sf_games')
  end

  def create  
    @user = User.new(user_params)
    if @user.valid?
      # @user.address.build      
      # @user.funding_projects.build

      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
      @user = User.find(params[:id]) 
      @pledges = Pledge.where(:user_id == @user.id)
      @user.sf_favs.build
      # make new sffav here
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
    params.require(:user).permit(:name, :email, :password, sf_favs_attributes: [:id, :fav_lits, :fav_films, :fav_games], addresses_attributes: [:address1, :address2, :city, :state, :zip, :user_id], created_funding_project_attributes: [:creator_name, :title, :description], )

  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end