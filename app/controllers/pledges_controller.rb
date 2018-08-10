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

        # @pledge.user_id = current_user.id
        # @pledge.funding_project_id = params[:pledge][:funding_project_id] 
        # if @pledge.valid?
        #   @pledge.save
        #   redirect_to pledge_path(@pledge)
        # else
        #   render :new
        # end
    end
        

    def show
        @fp_backed = FpBacked.find_by(id: params[:fp_backed_id])
        @pledge = @fp_backed.pledges.find_by(id: params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def pledge_params
        params.require(:pledge).permit(:amount, :fp_backed_name, :fp_backed_id)
    end

    def require_login
        unless logged_in?
        flash[:alert] = "You must be logged in to access this section"
        redirect_to login_path
        end
    end
end
