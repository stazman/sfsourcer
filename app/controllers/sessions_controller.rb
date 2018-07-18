class SessionsController < ApplicationController
    def new
    end

    def create

        # raise params.inspect
        if auth_hash = request.env["omniauth.auth"]
            user = User.find_or_create_by_ominauth(auth_hash)
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

        #why parentheses here and not with redirect_to below?

        end
    end

    def destroy
        session.clear
        render :new
    end
end