class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    #should I create separate logic in the same method for omniauth? a different method?
    
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
            # user_pledges = @user.pledges
      @pledges = Pledge.where(:user_id == @user.id)
      # @pledge_funding_project = FundingProject.where()
      # @funding_projects = FundingProject.where(Pledge.funding_project_id == @funding_project.id)
# if require_login
      # redirect_to login_path
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
    params.require(:user).permit(:name, :email, :password)
  end

  unless logged_in?
    flash[:error] = "You must be logged in to access this section"
    redirect_to new_login_url
  end
end


# def create
#   @user = User.find_or_create_by(uid: auth['uid']) do |u|
#     u.name = auth['info']['name']
#     u.email = auth['info']['email']
#     u.image = auth['info']['image']
#   end

#   session[:user_id] = @user.id

#   render 'welcome/home'
# end

# private

# def auth
#   request.env['omniauth.auth']
# end

# <% if session[:user_id] %>
#   <h1><%= @user.name %></h1>
#   <h2>Email: <%= @user.email %></h2>
#   <h2>Facebook UID: <%= @user.uid %></h2>
#   <img src="<%= @user.image %>">
# <% else %>
#   <%= link_to('Log in with Facebook!', '/auth/facebook') %>
# <% end %>

