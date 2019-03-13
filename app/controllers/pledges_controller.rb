class PledgesController < ApplicationController
    before_action :require_login
  
    def index
      if params[:funding_project_id]
        @funding_project = FundingProject.find_by(id: params[:funding_project_id])
        @pledges = @funding_project.pledges
        render :json => @pledges
        # respond_to do |f|
        #   f.html (render :index)
        #   f.json (render :json => @pledges)
        # end
        # @pledges = Pledge.all
      else
        @pledges = Pledge.all
      end
    end
  
    def new
      # @pledge = Pledge.new
      @pledge = Pledge.new(fp_backer_id: params[:fp_backer_id], funding_project_id: params[:funding_project_id])
      render :layout => 'navbar_on_top'
    end
  
    def create
      @pledge = Pledge.new(pledge_params)
      if @pledge.valid?
        @pledge.save
        redirect_to @pledge
      else
        render :new
      end
          
      # @pledge.user_id = current_user.id
      # @fp_backer = FpBacker.where(id: current_user.id)
      # @pledge.funding_project_id = params[:pledge][:funding_project_id] 
      # if @pledge.valid?
      # else
      #   render :new
      # end
    end
        
  
    def show
      if params[:funding_project_id]
        @funding_project = FundingProject.find_by(id: params(:funding_project_id))
        @pledge = @funding_project.pledges.find_by(id: params[:id])
      else  
        @pledge = Pledge.find(params[:id])
      end
      render :layout => 'navbar_on_top'
      # @fp_backer = FpBacker.find_by(id: params[:fp_backer_id])
      # @pledge = @fp_backer.pledges.find_by(id: params[:id])
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end
  
  private
  
    def pledge_params
      params.require(:pledge).permit(:amount, :fp_backer_id, :fp_backer_name, :funding_project_title, :funding_project_id)
    end
  
    def require_login
      unless logged_in?
        flash[:alert] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end
  end
