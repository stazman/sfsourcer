class FundingProjectsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]
  # before_save :make_titlecase

  def index
    @funding_projects = FundingProject.all
  end

  def new
    @funding_project = FundingProject.new

  end

  def create
    @funding_project = FundingProject.new(funding_project_params)

    @funding_project.save

    fp_pledges = @funding_project.pledges
    
    redirect_to funding_project_path(@funding_project)#create and save new FP instance
  end

  def show
    @funding_project = FundingProject.find_by(id: params[:id])
    @total_pledges = []
  end

  def edit
    #make editong an already made FP instance possible
  end

  def update
    #update an already made FP instance, including saving it
  end

  def destroy
  end

  private

  def funding_project_params
    params.require(:funding_project).permit(:funding_project_pledge, :title, :description, :funding_goal)
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url
    end
  end


#   def total_pledges
#     self.pledges.each do |p| 
#        p.amount  
#     end
# end

end