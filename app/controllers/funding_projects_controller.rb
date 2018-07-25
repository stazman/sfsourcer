class FundingProjectsController < ApplicationController
  before_action :require_login
  # skip_before_action :require_login, only: [:index, :show]
  # before_save :make_titlecase

  def index
    @funding_projects = FundingProject.all
  end

  def comments_index
    @funding_project = FundingProject.find(params[:id])
    @comments = @funding_project.comments
    render template: 'comments/index'
  end

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
      # fp_pledges = @funding_project.pledges
      @funding_project.save
  
      redirect_to funding_project_path(@funding_project)
    else
      render :new
    end


  end

  def show
    @funding_project = FundingProject.find(params[:id])
    @total_pledges = []
    @comments = Comment.where(:funding_project_id == @funding_project.id)
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
    params.require(:funding_project).permit(:funding_project_pledge, :user_id, :creator, :title, :description, :funding_goal, comments_attributes: [:title, :content] )
  end

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