class CommentsController < ApplicationController
  before_action :require_login

  def index
    @comments = Comment.all
    funding_project = FundingProject.find(params[:funding_project_id])
    @comments = funding_project.comments.build
  end
 
  def new
    @comment = Comment.new
    # funding_project = FundingProject.find(params[:funding_project_id])
    @comment = funding_project.comment.build
  end

  def create  
    @comment = Comment.new(comment_params)
    # create a comment with a funding_project id of the specific project it is created under
     # raise params.inspect
    # if @comment.valid?
    # @comment.user_id = current_user
    # @funding_project.id = @comment.funding_project_id

      @comment.save
      redirect_to funding_project_comment_path(@comment)
    # else
    #   render :new
    # end
  end

  def show
      @comment = Comment.find(params[:id]) 
      # funding_project = FundingProject.find(params[:funding_project_id])
      # @comment = funding_project.comments.find(params[:id])
  end

  def edit
      @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.update(comment_params)
    @comment.save
    redirect_to comment_path(@comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :user_id, :funding_project_id)
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end