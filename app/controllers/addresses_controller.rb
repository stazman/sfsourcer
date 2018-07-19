class AddressesController < ApplicationController
  before_action :require_login
  
  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.valid?
      @address.save
      redirect_to address_path(@pledge)
    else
      render :new
    end
  end

  def show
    @address = Address.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:address1, :address2, :city, :state, :zip)
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end
