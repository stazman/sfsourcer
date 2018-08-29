class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      @current_user = session[:user_id]
      redirect_to root_url
    #   user_path(user.id)( ??? shouldn't this work if the app is working, or it doesn't make sense because user info is stored on FB db?)
    else
      @user = User.find_by(email: params[:sessions][:email])
        # @user = user.try(:authenticate, params[:sessions][:password])
      # user = User.find_by(params[:email])
      # user && user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end
    
  def destroy
    reset_session
    session[:user_id] = nil
    redirect_to login_path
  end

private
       
    def auth
        request.env['omniauth.auth']
    end
end