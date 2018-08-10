class PledgesController < ApplicationController
    before_action :require_login
    
    def index
        @pledges = Pledge.all
    end

    def new
        @pledge = Pledge.new(fp_backed_id: params[:fp_backed_id])
    end

    def create
        @pledge = Pledge.new(pledge_params)
        @pledge.save
        redirect_to @pledge
    end
        

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def pledge_params
        params.require(:pledge).permit(:amount)
    end

    def require_login
        unless logged_in?
        flash[:alert] = "You must be logged in to access this section"
        redirect_to login_path
        end
    end
end
