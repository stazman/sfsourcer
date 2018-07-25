module UsersHelper
    def user_fp_creator
        @user = FpCreator.where(:user_id == @user.id)
        # or try current_user.id or @current_user.id
    end
end
