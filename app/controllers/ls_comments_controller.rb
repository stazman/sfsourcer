class LsCommentsController < ApplicationController

  def create
    @ls_comment = LsComment.create(ls_comment_params)
    redirect_to l_story_path(@ls_comment.l_story)
  end

  private

  def ls_comment_params
    params.require(:ls_comment).permit(:content, :l_story_id, :ls_user_id, ls_user_attributes:[:username])
  end
end
