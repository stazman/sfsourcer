class FpCreatorsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]
  
  def index
    @fp_creators = FpCreator.search(params[:term])
  end

  def show
    @fp_creator = FpCreator.find(params[:id])
  end

  def new
    @fp_creator = FpCreator.new
  end

  def create
    @fp_creator = FpCreator.new(fp_creator_params)
  
    # @fp_creator.lit_fan_works.build
      # = LitFanWork.where(fp_creator_id: params[:fp_creator_id])

    if @fp_creator.save
      redirect_to @fp_creator
    else
      render :new
    end
  end

  def edit
    @fp_creator = FpCreator.find(params[:id])
  end

  def update
    @fp_creator = FpCreator.find(params[:id])

    @fp_creator.update(fp_creator_params)

    if @fp_creator.save
      redirect_to @fp_creator
    else
      render :edit
    end
  end

  # Namespace destroy
  def destroy
    @fp_creator = fp_creator.find(params[:id])
    @fp_creator.destroy
    flash[:notice] = "Author deleted."
    redirect_to fp_creators_path
  end

  private

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end

  def fp_creator_params
    params.require(:fp_creator).permit(
      "name",
      "location",
      "creator_about",
      "creator_site",
      "instagram_url",
      "twitter_url",
      "facebook_url",
      "blog_url",
      "user_id"
      # funding_projects_attributes: [:title, :description, :funding_goal]
    )
  end
