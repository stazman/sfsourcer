class PledgesController < ApplicationController
    before_action :require_login
  
    def index
      if params[:funding_project_id]
        @funding_project = FundingProject.find_by(id: params[:funding_project_id])
        @pledges = @funding_project.pledges
        render :json => @pledges
      else
        @pledges = Pledge.all
      end
    end
  
    def new
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
    end
        
  
    def show
      if params[:funding_project_id]
        @funding_project = FundingProject.find_by(id: params(:funding_project_id))
        @pledge = @funding_project.pledges.find_by(id: params[:id])
        respond_to do |f|
          f.html { render :show }
          f.json { render :json => @pledge }
        end
      else  
        @pledge = Pledge.find(params[:id])
        respond_to do |f|
          f.html { render :show }
          f.json { render :json => @pledge }
        end
      end
      # render :layout => 'navbar_on_top'
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
