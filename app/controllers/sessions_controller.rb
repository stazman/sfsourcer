class SessionsController < ApplicationController
    def new
    end

    def create

        # raise params.inspect
        

        user = User.find_by(email: params[:email])
        authenticated = user.try(:authenticate, params[:password])
        # return head(:forbidden) unless authenticated
        if user && user.authenticated && user.valid?
        # if auth = request.env["omniauth.auth"]
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to(controller: 'sessions', action: 'new')

        #why parentheses here and not with redirect_to below?

        end
    end

    def destroy
        session.clear
        render :new
    end
end