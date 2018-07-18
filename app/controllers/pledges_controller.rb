class PledgesController < ApplicationController
  before_action :require_login
  
  def index
    @pledges = Pledge.all
  end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user_id = current_user.id
    @pledge.funding_project_id = params[:pledge][:funding_project_id] 
    if @pledge.valid?
      @pledge.save
      redirect_to pledge_path(@pledge)
    else
      render :new
    end
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
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end
