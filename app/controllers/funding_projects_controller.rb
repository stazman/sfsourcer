class FundingProjectsController < ApplicationController
  before_action :require_login
  # skip_before_action :require_login, only: [:index, :show]
  # before_save :make_titlecase

  def index
    @funding_projects = FundingProject.all
    @user = User.find_by(id: params[:user_id])
    @funding_projects = @user.funding_projects
  end

  # def comments_index
  #   @funding_project = FundingProject.find(params[:id])
  #   @comments = @funding_project.comments
  #   render template: 'comments/index'
  # end

  # def comment
  #   @funding_project = FundingProject.find(params[:id])
  #   @funding_project.comment.id = Comment.find(params[:id])
  #   render template: 'comments/show'
  # end

  def new
    @funding_project = FundingProject.new
    # @funding_project.comments.build
    # @funding_project.user_id = current_user
    # @comment = @comment.find_by(:id)
    # @funding_project.id = @comment.fundng_project_id
    # @funding_project.comments.build
  end

  def create
    @funding_project = FundingProject.new(funding_project_params)
    if @funding_project.valid?

    # raise params.inspect
    
    # @funding_project.fp_creator_id = 
    # @funding_project.fp_creator_id = FpCreator.where(:id == current_user.id)
    # if @funding_project.valid?
      # fp_pledges = @funding_project.pledges
      @user = User.find_by(id: params[:user_id])

      @funding_project.save
  
      redirect_to user_funding_project_path(@funding_project)
    else
      # funding_project_path(@funding_project)
    # else
      render :new
    end
    end

  def show
    @funding_project = FundingProject.find(params[:id])
    @total_pledges = []
    # @comments = Comment.where(:funding_project_id == @funding_project.id)
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
    params.require(:funding_project).permit(
      # :funding_project_pledge,
      :creator_name,
      :user_id,
      # :creator,
      :title,
      :description, 
      :funding_goal, 
      # comments_attributes: [:title, :content]
      )
  end

  # def fp_creator_params
  #   params.require(:fp_creator).permit(
  #     "name",
  #     "location",
  #     "name_of_verified",
  #     "verified?",
  #     "creator_profile",
  #     "last_logged_in",
  #     "fp_amt_created",
  #     "fp_amt_backed",
  #     "creator_site",
  #     "instagram_url",
  #     "twitter_url",
  #     "facebook_url",
  #     "blog_url",
  #     "user_id",
  #     funding_projects_attributes: [:title, :description, :funding_goal]
  #   )
  # end


  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end


#   def total_pledges
#     self.pledges.each do |p| 
#        p.amount  
#     end
# end

end