class FundingProjectsController < ApplicationController
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
    
  whenever you make a new pledge, you shovel it into the array of a given funding project's array of pledges
    
    
    
    # @pledge = Pledge.where(:funding_project_id == @funding_project.id)
    # pledge = Pledge.create(params[:amount])
    # @funding_project.pledges < pledge
    redirect_to funding_project_path(@funding_project)#create and save new FP instance
  end

  def show
    @funding_project = FundingProject.find(params[:id])
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
end
