class LsUsersController < ApplicationController

    def show
        @ls_user = LsUser.find(params[:id])
    end
end