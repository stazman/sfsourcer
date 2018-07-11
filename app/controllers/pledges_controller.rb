class PledgesController < ApplicationController
  def index
    #must be associated with user and with project
  end

  def new
      

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

end
