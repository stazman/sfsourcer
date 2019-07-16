class LitFanWorksController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]
  
  def index
    if params[:lit_fan_author_id]
      @lit_fan_author = LitFanAuthor.find_by(id: params[:lit_fan_author_id])
      if @lit_fan_author.nil?
        redirect_to lit_fan_author_path, alert: "Author not found"
      else
        @lit_fan_works = @lit_fan_author.lit_fan_works
      end
    else
      @lit_fan_works = LitFanWork.all
    end
  end

  def new
    if params[:lit_fan_author_id] && !LitFanAuthor.exists?(id: params[:lit_fan_author_id])
      redirect_to lit_fan_author_path, alert: "Author not found"
    else
      @lit_fan_work = LitFanWork.new(lit_fan_author_id: params[:lit_fan_author_id])
    end
  end

  def create
    @lit_fan_work = LitFanWork.new(lit_fan_work_params)
    if @lit_fan_work.valid?
      @lit_fan_work.save
      redirect_to @lit_fan_work
    else
      render :new
    end
  end

  def show
    if params[:lit_fan_author_id]
      @lit_fan_author = LitFanAuthor.find_by(id: params[:lit_fan_author_id])
      @lit_fan_work = @lit_fan_author.lit_fan_works.find_by(id: params[:id])
    else
      @lit_fan_work = LitFanWork.find(params[:id])
    end
  end

  def edit
    if params[:lit_fan_author_id]
      lit_fan_author = LitFanAuthor.find_by(id: params[:lit_fan_author_id])
      if lit_fan_author.nil?
        redirect_to lit_fan_author_path, alert: "Author not found"
      else
        @lit_fan_work = lit_fan_author.lit_fan_works.find_by(id: params[:id])
        redirect_to lit_fan_works_path(lit_fan_author), alert: "Work not found." if @lit_fan_work.nil?
      end
    else
      @lit_fan_work = LitFanWork.find(params[:id])
    end
  end

  def update
    @lit_fan_work = LitFanWork.find(params[:id])
    @lit_fan_work.update(lit_fan_work_params)
    if @lit_fan_work.save
      redirect_to @lit_fan_work
    else
      render :edit
    end
  end

  # Namespace destroy
  def destroy
    @lit_fan_work = LitFanWork.find(params[:id])
    @lit_fan_work.destroy
    flash[:notice] = "Work deleted."
    redirect_to lit_fan_works_path
  end

  private

  def lit_fan_work_params
    params.require(:lit_fan_work).permit(:title, :lit_fan_author_name, :lit_fan_author_id, lit_fan_genre_ids:[], lit_fan_genres_attributes: [:name])
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end
