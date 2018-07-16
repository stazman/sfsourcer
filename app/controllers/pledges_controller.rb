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
    # @user = current_user
    # new_pledge_fp = FundingProject.where(:id == @pledge.funding_project_id)
    # @pledge = new_pledge_fp 
    @pledge = Pledge.new({
      {
        project_pledge: params[:funding_project][:project_pledge],
        
       }
      }, pledge_params)
      
    @pledge.user_id = session[:user_id]

    # binding.pry
    
    
    # need to make a new pledge and 
    # @pledge.user_id = current_user
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
    params.require(:pledge).permit(:product_pledges, :amount)
  end

  # def require_login
  #   return head(:forbidden) unless session.include? :user_id   
  # end
end
