class PledgesController < ApplicationController
  before_action :require_login
  
  def index
    @pledges = Pledge.all
    #must be associated with user and with project
  end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user_id = current_user
    # new_pledge = @pledge = Pledge.new(pledge_params)
    if @pledge.valid?
      @pledge.save
      redirect_to pledges_path(@pledge)
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
    params.require(:pledge).permit(:amount)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id   
  end
end
