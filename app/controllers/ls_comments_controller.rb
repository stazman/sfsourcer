class LsCommentsController < ApplicationController
  
  def index
    @ls_comments = ls_comment.all
  end

  def new
    @ls_comment = LsComment.new
  end

  def create
    @ls_comment = LsComment.new(ls_comment_params)
    # @ls_comment.user_id = current_user.id
    @ls_comment.l_story_id = params[:ls_comment][:l_story_id] 
    # if @ls_comment.valid?
    #   @ls_comment.save
    #   redirect_to ls_comment_path(@ls_comment)
    # else
    #   render :new
    # end
    redirect_to l_story_path(@ls_comment.l_story)
  end

  def show
    @ls_comment = LsComment.find(params[:id])
  end

  private

  def ls_comment_params
    params.require(:ls_comment).permit(:content, :l_story_title, :l_story_id, :user_id, user_attributes:[:name])
  end
end
