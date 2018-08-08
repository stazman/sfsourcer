class FpCreatorsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]
  
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @fp_creator.nil?
        redirect_to user_path, alert: "User not found"
      else   
        @fp_creators = @user.fp_creators
      end
    # # This is if I only want to show the user as well as its fp_creator .. perhaps a later option; check lit_fan)works_controller for more code
    else
      @fp_creators = FpCreator.all
    end

    # if params[:lit_fan_author_id]
    #   @lit_fan_author = LitFanAuthor.find_by(id: params[:lit_fan_author_id])
    #   if @lit_fan_author.nil?
    #     redirect_to lit_fan_author_path, alert: "Author not found"
    #   else
    #     @lit_fan_works = @lit_fan_author.lit_fan_works
    #   end
    # else
    #   @lit_fan_works = LitFanWork.all
    # end

  end

  def new
    if params[:user_id] && !User.exists?(id: params[:user_id])
      redirect_to user_path, alert: "User not found"
      # This is for when a new lit_fan_work with artist params is being made, so unlike #show and #edit, no work is to be found
    else
      @fp_creator = FpCreator.new(user_id: params[:user_id])
    end
  end

  # if params[:lit_fan_author_id] && !LitFanAuthor.exists?(id: params[:lit_fan_author_id])
  #   redirect_to lit_fan_author_path, alert: "Author not found"
  #   # This is for when a new lit_fan_work with artist params is being made, so unlike #show and #edit, no work is to be found
  # else
  #   @lit_fan_work = LitFanWork.new(lit_fan_author_id: params[:lit_fan_author_id])
  # end

  def create
    @fp_creator = FpCreator.new(fp_creator_params)
    # raise params.inspect
  
    # @fp_creator.lit_fan_works.build
      # = LitFanWork.where(fp_creator_id: params[:fp_creator_id])
    if @fp_creator.save
      redirect_to fp_creator_path(@fp_creator)
    else
      render :new
    end
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @fp_creator = @user.fp_creators.find_by(id: params[:id])
    #   # only if user to be included here, too
    else
      @fp_creator = FpCreator.find(params[:id])
    end
  end

  def edit
    @fp_creator = FpCreator.find(params[:id])
  end

  def update
    @fp_creator = FpCreator.find(params[:id])

    @fp_creator.update(fp_creator_params)

      @fp_creator.save
      redirect_to fp_creator_path(@fp_creator)
      render :edit
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
      "user_id",
      "fpc_user_name"
    )
  end
end 
     # funding_projects_attributes: [:title, :description, :funding_goal]
