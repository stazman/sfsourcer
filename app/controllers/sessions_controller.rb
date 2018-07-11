class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:email][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/login'
        end
    end

    def destroy
        session.clear
        render :new
    end
end