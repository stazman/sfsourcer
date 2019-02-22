class WriterGroupsController < ApplicationController
  def index
    @writer_groups = WriterGroup.all
  end

  def new
    @writer_group = WriterGroup.new
  end

  def create
    @writer_group = WriterGroup.create(writer_group_params)
    if @funding_project.save
      redirect_to @writer_group
    else
      render :new
    end
  end

  def show
    @writer_group = WriterGroup.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def writer_group_params
    params.require(:writer_group).permit(:wg_creator, :wg_name, :wg_description)
  end

end