class PledgesController < ApplicationController
  before_action :require_login
  
  def index
    @pledges = Pledge.all
  end

  def new
    @pledge = Pledge.new
    @pledge.user_id = current_user
    # new_user_pledge = User.where(:id == @pledge.user_id)
    # @pledge.user_id = new_user_pledge    
  end

  def create
    @pledge = Pledge.new(pledge_params)
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
    params.require(:pledge).permit(:amount, :funding_project_title)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id   
  end
end
