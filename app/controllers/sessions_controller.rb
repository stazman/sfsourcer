class SessionsController < ApplicationController
    def new
    end

    def create

        # raise params.inspect
        
        user = User.find_by(email: params[:sessions][:email])
        user = user.try(:authenticate, params[:sessions][:password])

        return redirect_to(controller: 'sessions', action: 'new') unless user

        #why parentheses here and not with redirect_to below?

        session[:user_id] = user.id

        @user = user
        redirect_to user_path(@user)
    end

    def destroy
        session.clear
        render :new
    end
end