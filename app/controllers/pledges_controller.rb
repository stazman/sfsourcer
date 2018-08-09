class PledgesController < ApplicationController
  before_action :require_login
  
  def index
    @pledges = Pledge.all
  end

  def new
    @pledge = Pledge.new(fp_backed_id: params[:fp_backed_id])
  end

  def create
    @pledge = @fp_backed.lit_fan_works.find_by(id: params[:id])
    @fp_backed = @fp_backed.pledges.find_by(id: params[:id])

    # @pledge.user_id = current_user.id
    # @pledge.funding_project_id = params[:pledge][:funding_project_id] 
    # if @pledge.valid?
    #   @pledge.save
    #   redirect_to pledge_path(@pledge)
    # else
    #   render :new
    # end
  end
      

  def show
    @pledge = Pledge.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def pledge_params
    params.require(:pledge).permit(:amount, :funding_project_title, :user_id, :funding_project_id)
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end
