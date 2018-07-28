class CommentsController < ApplicationController
  before_action :require_login

  def index
    @comments = Comment.all
  end
 
  def new
    @comment = Comment.new
    # @comment.funding_project.build(:id => :funding_project_id)

  end

  def create  
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.funding_project_id = params[:fp_comment][:funding_project_id] 
    if @comment.valid?
      @comment.save
      redirect_to funding_project_comment_path(:funding_project_id, @comment)
    else
      render :new
    end


    # @comment.save
    # redirect_to funding_project_comment_path(@comment)
  end

  def show
      @comment = Comment.find(params[:id]) 
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
    params.require(:fp_comment).permit(:title, :content, :user_id, :funding_project_id)
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end