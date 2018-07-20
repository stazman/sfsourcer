class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def addresses_index
    @user = User.find(params[:id])
    @addresses = @user.addresses
    render template: 'addresses/index'
  end
 
  def post
    @user = User.find(params[:id])
 
    # Note that because ids are unique by table we can go directly to
    # Post.find — no need for @author.posts.find...
    @address = Address.find(params[:user_id])
    render template: 'addresses/show'
  end

  def new
    @user = User.new
    @user.addresses.build
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
      @pledges = Pledge.where(:user_id == @user.id)
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
    params.require(:user).permit(:name, :email, :password, addresses_attributes: [:address1, :address2, :city, :state, :zip])
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end