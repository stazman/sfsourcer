class SessionsController < ApplicationController
    def new
    end

    def create

        # raise params.inspect
        
        user = User.find_by(params[:email])
        user = user.try(:authenticate, params[:user][:password])
# raise params.inspect
        if user && user.authenticate(:password => params[:user][:password]) && user.valid?
        # if auth = request.env["omniauth.auth"]
            session[:user_id] = user.id
            # @user = user
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