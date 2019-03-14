class WgWorksController < ApplicationController
  def index
    @wg_work = WgWork.new
    @wg_works = WgWork.all
  end

  def new
    @wg_work = WgWork.new
  end

  def create
    @wg_work = WgWork.new(wg_work_params)
    @wg_work.save
    redirect_to @wg_work 
  end

  def show
    @wg_work = WgWork.find(params[:id])
    @wg_comment = @wg_work.wg_comments.build
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @wg_work }
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def wg_work_params
    params.require(:wg_work).permit(:author, :bio, :title, :version, :content)
  end
end