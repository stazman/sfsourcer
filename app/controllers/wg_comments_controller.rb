class WgCommentsController < ApplicationController
  # def index
  #   @list = List.new
  #   @wg_comments = WgComment.all
  # end

  # def new
  #   @wg_comment = WgComment.new
  # end

  def create
    @wg_work = WgWork.find(params[:wg_work_id])
    @wg_comment = @wg_work.wg_comments.build(wg_comment_params)
    @wg_comment.save
    redirect_to wg_work_path(@wg_work)
  end

  # def show
  #   @wg_comment = WgComment.find(params[:id])   
  # end

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