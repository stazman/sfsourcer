class SessionsController < ApplicationController
  def new
    render :layout => 'navbar_on_top'
  end

  def create
    # # raise params.inspect
    if request.env['omniauth.auth']
      @user = User.find_or_create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      @current_user = session[:user_id]
      redirect_to root_url
    #   user_path(user.id)( ??? shouldn't this work if the app is working, or it doesn't make sense because user info is stored on FB db?)
    else
        return redirect_to(controller: "sessions", action: "new") if !params[:sessions][:email] || params[:sessions][:password].empty?
        user = User.find_by(email: params[:sessions][:email])
        # user = user.try(:authenticate, params[:user][:password])
        # unless user.email.blank? || user.?
      # unless !!user.valid?
        session[:user_id] = user.id
        redirect_to root_url
      # else
      #   flash[:notice] = "Valid login information required." 
      #   redirect_to new_session_path
      # end
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