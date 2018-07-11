class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(user_params)
    @user.save
  end

  def destroy
    @user.delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :comment_attributes, :pledge_attributes)
  end
end
