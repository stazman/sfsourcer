class WgWorksController < ApplicationController
  def index
    @wg_works = WgWork.all
  end

  def new
    @wg_work = WgWork.new
  end

  def create
    @wg_work = WgWork.create(wg_work_params)
    if @wg_work.save
      redirect_to @wg_work
    else
      render :new
    end
  end

  def show
    @wg_work = WgWork.find(params[:id])   
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
