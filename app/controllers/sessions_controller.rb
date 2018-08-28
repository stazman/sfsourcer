class SessionsController < ApplicationController
    def new
    end

    def create
        if request.env['omniauth.auth']
          user = User.create_with_omniauth(request.env['omniauth.auth'])
          session[:user_id] = user.id
          # binding.pry
          @current_user = session[:user_id]
          redirect_to root_url
        #   user_path(user.id)( ??? shouldn't this work if the app is working, or it doesn't make sense because user info is stored on FB db?)
        else
          user = User.find_by_email(params[:email])
          user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to user_path(user.id)
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


      
    #         def create
    #             user = User.find_or_create_by(:uid => auth['uid']) do |user|
    #               user.name = auth['info']['name']
    #         #  binding.pry
    #             end
    #             session[:user_id] = user.try(:id)
    #             redirect_to root_url
    #           end
    # #     if # request.env["omniauth.auth"]
    # #     @user = User.find_or_create_by(uid: auth['uid']) do |u|
    # #     u.name = auth['info']['name']
    # #     u.email = auth['info']['email']
    # #     u.image = auth['info']['image']

    # #             binding.pry
    # # #   end
    # # #   if @user if @user.persisted?
    # #           end
    # #     session[:user_id] = @user.id

    #     redirect_to root_path
    # #   else 
    # #     redirect_to root_path
    # #   end
    # end

            # user = User.find_or_create_by(uid: auth[:uid]) do |u|
            #     u.name = auth['info']['name']
        #         end
        # if user
        #         session[:user_id] = user.id
        #         # try(:uid)
        #     redirect_to root_path
        # else
        #     redirect_to(controller: 'sessions', action: 'new')
        # end
        # else
        #     redirect_to(controller: 'static', action: 'sf_lit_fanvorites')
            

        #     user = User.find_by(email: params[:sessions][:email])
        #     authenticated = user.try(:authenticate, params[:sessions][:password])
        # # return head(:forbidden) unless authenticated
        #         session[:user_id] = user.id
        #         redirect_to user_path(user)
        #     else
        #         redirect_to(controller: 'sessions', action: 'new')
        #     end
    #     end
    # end

    # def create
    #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #     u.name = auth['info']['name']
    #     u.email = auth['info']['email']
    #     u.image = auth['info']['image']
    #   end
    # #   if @user if @user.persisted?
    #     session[:user_id] = @user.id

    #     redirect_to root_path
    # #   else 
    # #     redirect_to root_path
    # #   end
    # end


#     def create
#         if request.env['omniauth.auth']
#           user = User.create_with_omniauth(request.env['omniauth.auth'])
#           session[:user_id] = user.id    
#           redirect_to user_path(user.id)
#         else
#           user = User.find_by_email(params[:email])
#           user && user.authenticate(params[:password])
#           session[:user_id] = user.id
#           redirect_to user_path(user.id)
#         end
#       end
#     # def create
#     #     user = User.find_or_create_by(uid: auth[:uid]) do |u|
#     #         u.name = auth['info']['name']
#     #     end
#     #         session[:user_id] = user.try(:id)

#     #     # render 'welcome/home'

#     # end


#     def destroy
#         reset_session
#         session[:user_id] = nil
#         redirect_to login_path
#     end
# end     

# private 

# def auth
#     request.env['omniauth.auth']
# end

        # if session[:user_id]
        # @current_user = nil
        # session.delete :user_id
        # redirect_to login_path

        # def facebook
        #     @user = User.create_from_provider_data(request.env['omniauth.auth'])
        #     if @user.persisted?
        #       sign_in_and_redirect @user
        #       set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
        #     else
        #       flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
        #       redirect_to new_user_registration_url
        #     end 
        #   end