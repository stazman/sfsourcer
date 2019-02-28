class WgCommentsController < ApplicationController

  def create
    @wg_work = WgWork.find(params[:wg_work_id])
    @wg_comment = @wg_work.wg_comments.build(wg_comment_params)
    @wg_comment.save
    redirect_to wg_work_path(@wg_work)
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def wg_comment_params
    params.require(:wg_comment).permit(:author, :content)
  end
end