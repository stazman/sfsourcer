class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
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
    if require_login
      @user = User.find(params[:id])
    else 
      redirect_to login_path
    end
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.update(user_params)
    @user.save
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :comment_attributes, :pledge_attributes)
  end

  # def require_login
  #   session[:user_id] = @user.id
  # end
end
