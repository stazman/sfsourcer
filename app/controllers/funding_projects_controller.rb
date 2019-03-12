class FundingProjectsController < ApplicationController
  before_action :require_login
  # skip_before_action :require_login, only: [:index, :show]
  # before_save :make_titlecase

  def index
    @funding_projects = FundingProject.all
    @newest_fps_first = FundingProject.all.reverse
  end

  def new
    @funding_project = FundingProject.new
    render :layout => 'navbar_on_top'
  end

  def create
    @funding_project = FundingProject.new(funding_project_params)
    if @funding_project.save
      respond_to do |f|
        f.html { redirect_to @funding_project }
        f.json { render :json => @funding_project }
      end
    else
      render :new
    end
  end

  def body
    fpd = FundingProject.find(params[:id])
    render plain: fpd.description
  end

  def show
    @funding_project = FundingProject.find(params[:id])
    # render :json => @funding_project

    respond_to do |f|
      f.html { render :show }
      f.json { render :json => @funding_project }
    end
    # creates infinite loop of redirects
    
    # @user = User.find_by(id: params[:user_id])
    # @funding_project = @user.funding_projects.find_by(id: params[:id])
    # @total_pledges = []
    # render :layout => 'navbar_on_top'
  end

  def description
    fpd = FundingProject.find(params[:id])
    render plain: fpd.description
    # respond_to do |format| {
    #   format.js {
    #     :layout => false;
    #   }
    # end

    # }
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
    params.require(:funding_project).permit(:title, :description, :funding_goal, fp_creator_ids: [], fp_creators_attributes: [:creator_name, :location, :creator_about, :creator_site, :email, :instagram_url, :twitter_url, :facebook_url, :blog_url]) 
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end