class CommentsController < ApplicationController
  before_action :require_login

  def index
    @comments = Comment.all
  end
 
  def new
    @comment = Comment.new
  end

  def create  
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to comment_path(@comment)
    else
      render :new
    end
  end

  def show
      @comment = Comment.find(params[:id]) 
    #   @pledges = Pledge.where(:user_id == @user.id)
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