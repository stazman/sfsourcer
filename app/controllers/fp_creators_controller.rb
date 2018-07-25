class FpCreatorsController < ApplicationController
  before_action :require_login

  def index
    @fp_creators = FpCreators.all
  end

  def new
    @fp_creator = FpCreator.new
  end

  def create  
    @fp_creator = fp_creator.new(fp_creator_params)
    if @fp_creator.valid?
      @fp_creator.save
      redirect_to fp_creator_path(@fp_creator)
    else
      render :new
    end
  end

  def show
      @fp_creator = FpCreator.find(params[:id]) 
  end

  def edit
      @fp_creator = FpCreator.find(params[:id])
  end

  def update
    @fp_creator = FpCreator.update(fp_creator_params)
    @fp_creator.save
    redirect_to fp_creator_path(@fp_creator)
  end

  private

  def fp_creator_params
    params.require(:fp_creator).permit(
      "name",
      "location",
      "name_of_verified",
      "verified?",
      "creator_profile",
      "last_logged_in",
      "fp_amt_created",
      "fp_amt_backed",
      "creator_site",
      "instagram_url",
      "twitter_url",
      "facebook_url",
      "blog_url",
      "user_id"
    )
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end
