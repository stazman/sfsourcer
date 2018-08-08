class FundingProjectsController < ApplicationController
  before_action :require_login
  # skip_before_action :require_login, only: [:index, :show]
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
    redirect_to user_funding_project_path(@user, @funding_project)
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @funding_project = @user.funding_projects.find_by(id: params[:id])
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
    params.require(:funding_project).permit
      (:title, 
        :description, 
        :funding_goal, 
        fp_creator_ids: [], 
        fp_creator_attributes:
      [:creator_name,
       :location,
       :creator_about,
       :creator_site,
       :instagram_url,
       :twitter_url,
       :facebook_url,
       :blog_url,    
      ]) 
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end