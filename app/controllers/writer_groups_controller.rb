class WriterGroupsController < ApplicationController
  
  def index
    @writer_groups = WriterGroup.all
    render :json => @writer_groups
  end

  def new
    @writer_group = WriterGroup.new
    render :layout => 'navbar_on_top'
  end

  def create
    @writer_group = WriterGroup.create(writer_group_params)
    render :json => @writer_group
  end

  def show
    @writer_group = WriterGroup.find(params[:id])
    respond_to do |f|
      f.html { render :show }
      f.json { render :json => @writer_group }
    end

    # render :layout => 'navbar_on_top'
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
