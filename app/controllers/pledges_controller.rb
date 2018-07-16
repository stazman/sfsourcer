class PledgesController < ApplicationController
  # before_action :require_login
  
  def index
    @pledges = Pledge.all
    #must be associated with user and with project
  end

  def new
    @pledge = Pledge.new
    new_user_pledge = User.where(:id == @pledge.user_id)
    @pledge.user_id = new_user_pledge    
  end

  def create
    @pledge = Pledge.new(pledge_params)
    # @pledge.user_id = session[:user_id]
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
    params.require(:pledges).permit(:amount)
  end

  # def require_login
  #   return head(:forbidden) unless session.include? :user_id   
  # end
end
