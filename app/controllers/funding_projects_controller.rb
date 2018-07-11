class FundingProjectsController < ApplicationController
  before_save :make_titlecase
  



  def index
    @funding_projects = FundingProject.all
  end

  def new
    #make new FP instance possible
  end

  def create
    #create and save new FP instance
  end

  def show
    #show newly created FP instance
  end

  def edit
    #make editong an already made FP instance possible
  end

  def update
    #update an already made FP instance, including saving it
  end
end
