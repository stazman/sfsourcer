class WgCommentsController < ApplicationController
  def index
    @wg_comments = WgComment.all
  end

  def new
    @wg_comment = WgComment.new
  end

  def create
    @wg_comment = WgComment.create(wg_comment_params)
    if @wg_comment.save
      redirect_to @wg_comment
    else
      render :new
    end
  end

  def show
    @wg_comment = WgComment.find(params[:id])   
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