class PledgesController < ApplicationController
    before_action :require_login
  
    def index
      @pledges = Pledge.all
    end
  
    def new
      # @pledge = Pledge.new
      @pledge = Pledge.new(fp_backer_id: params[:fp_backer_id])

    end
  
    def create
      @pledge = Pledge.new(pledge_params)
      # @pledge.user_id = current_user.id
      # @fp_backer = FpBacker.where(id: current_user.id)
      # @pledge.funding_project_id = params[:pledge][:funding_project_id] 
      # if @pledge.valid?

        @pledge.save
        redirect_to @pledge
      # else
      #   render :new
      # end
    end
        
  
    def show
      @pledge = Pledge.find(params[:id])
      @fp_backer = FpBacker.find_by(id: params[:fp_backer_id])
      @pledge = @fp_backer.pledges.find_by(id: params[:id])
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end
  
  private
  
    def pledge_params
      params.require(:pledge).permit(:amount, :fp_backer_name, funding_project_ids:[], funding_projects_attributes: [:title])
    end
  
    def require_login
      unless logged_in?
        flash[:alert] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end
  end
