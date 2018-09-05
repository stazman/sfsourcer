class LsCommentsController < ApplicationController

  def create
    @ls_comment = LsComment.create(ls_comment_params)
    redirect_to l_story_path(@ls_comment.l_story)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :l_story_id, :user_id, user_attributes:[:name])
  end
end
