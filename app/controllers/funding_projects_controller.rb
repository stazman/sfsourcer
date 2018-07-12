class FundingProjectsController < ApplicationController
  # before_save :make_titlecase
  

  def index
    @funding_projects = FundingProject.all
  end

  def new
    @funding_project = FundingProject.new#make new FP instance possible
  end

  def create
    @funding_project = FundingProject.new(funding_project_params)
    @funding_project.save
    # @pledges = Pledge.where(:funding_project_id == @funding_project.id)
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
