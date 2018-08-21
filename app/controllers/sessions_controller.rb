class SessionsController < ApplicationController
    def new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = user.id
            redirect_to root_path
        else
            user = User.find_by(email: params[:sessions][:email])
            authenticated = user.try(:authenticate, params[:sessions][:password])
        # return head(:forbidden) unless authenticated
            if user && authenticated
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                redirect_to(controller: 'sessions', action: 'new')
            end

        #why parentheses here and not with redirect_to above?

        end
    end

    def destroy
        reset_session
        session[:user_id] = nil
        #  if session[:user_id]
        # @current_user = nil
        # session.delete :user_id
        # redirect_to login_path
        redirect_to login_path
    end
end