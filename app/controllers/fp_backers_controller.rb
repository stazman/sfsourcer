class FpBackersController < ApplicationController
  before_action :require_login
  # skip_before_action :require_login, only: [:new, :create]

  def index
    @fp_backers = FpBacker.all
  end

  def new
    @fp_backer = FpBacker.new
  end

  def create  
    @fp_backer = FpBacker.new(fp_backer_params)
    if @fp_backer.valid?
      @fp_backer.save
      # session[:fp_backer_id] = @fp_backer.id
      redirect_to fp_backer_path(@fp_backer)
    else
      render :new
    end
  end

  def show
      @fp_backer = FpBacker.find(params[:id])
      @pledge = @fp_backer.pledges.find_by(params[:id])
      @funding_project = @fp_backer.funding_projects.find_by(params[:id])
      # @pledges = Pledge.where(:fp_backer_id == @fp_backer.id) 
      # @pledges = Pledge.where(:fp_backer_id == @fp_backer.id)
  end

  def edit
      @fp_backer = FpBacker.find(params[:id])
  end

  def update
    @fp_backer = FpBacker.update(fp_backer_params)
    @fp_backer.save
    redirect_to fp_backer_path(@fp_backer)
  end

  private

  def fp_backer_params
    params.require(:fp_backer).permit(:name, :user_id, funding_projects_ids:[], funding_projects_attributes: [:title], pledges_ids:[], pledges_attributes: [:amount])
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end

