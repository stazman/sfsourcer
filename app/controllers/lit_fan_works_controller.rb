class LitFanWorksController < ApplicationController
  def index
    @lit_fan_works = LitFanWork.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
