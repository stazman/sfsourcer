class LitFanWorksController < ApplicationController
  
  def index
    if params[:lit_fan_author_id]
      # NEED THIS TO CHECK BECAUSE NEED TO ... WHY DO WE NEED THIS IF #NEW HAS THIS?
      # THIS IS DONE BECAUSE in case index is rendered where aUTHOR AND lit_fan_work ARE both LISTED; PRESUMABLY NOT NECESSARY IF ONLY ONE MODEL INVOLVED?
      @lit_fan_author = LitFanAuthor.find_by(id: params[:lit_fan_author_id])
      if @lit_fan_author.nil?
        redirect_to lit_fan_author_path, alert: "Author not found"
      else
        @lit_fan_works = @lit_fan_author.lit_fan_works
      end
    else
      @lit_fan_works = LitFanWork.all
    end
  end

  def new
    if params[:lit_fan_author_id] && !LitFanAuthor.exists?(id: params[:lit_fan_author_id])
      redirect_to lit_fan_author_path, alert: "Author not found"
      # This is for when a new lit_fan_work with artist params is being made, so unlike #show and #edit, no work is to be found
    else
      @lit_fan_work = LitFanWork.new(lit_fan_author_id: params[:lit_fan_author_id])
    end
  end

  def create
    @lit_fan_work = LitFanWork.new(lit_fan_work_params)
    # raise params.inspect
    if @lit_fan_work.save
    #   # setting a condition about the save method being called actually calls the method if it's true? Is this generally true or just for the save method?
      redirect_to @lit_fan_work
    else
      render :new
    end
  end

  def show
    if params[:lit_fan_author_id]
      @lit_fan_author = LitFanAuthor.find_by(id: params[:lit_fan_author_id])
      @lit_fan_work = @lit_fan_author.lit_fan_works.find_by(id: params[:id])
      # This is done in case the specific work requested is expected to have the associated author with it
      # if @lit_fan_work.nil?
      #   redirect_to lit_fan_author_lit_fan_works_path(@lit_fan_author), alert: "Work not found"
           # This is done in case the specific work requested is expected to have the associated author with it but it doesn't
      # end
    else
      # And this is for in case the association ISN'T part of the request ... so in case eg you wanted to make a new lit_fan_work without an auithor for some other purpose later in the app?
      @lit_fan_work = LitFanWork.find(params[:id])
    end
  end

  def edit
    if params[:lit_fan_author_id]
      lit_fan_author = LitFanAuthor.find_by(id: params[:lit_fan_author_id])
      # This is in the case of a work that has an associated author needing to be edited
      if lit_fan_author.nil?
        redirect_to lit_fan_author_path, alert: "Author not found"
        # This is in the case of a work that has an associated author needing to be edited but there's no author
      else
        @lit_fan_work = lit_fan_author.lit_fan_works.find_by(id: params[:id])
        redirect_to lit_fan_works_path(lit_fan_author), alert: "Work not found." if @lit_fan_work.nil?
      end
    else
      @lit_fan_work = LitFanWork.find(params[:id])
    end
  end

  def update
    @lit_fan_work = LitFanWork.find(params[:id])

    @lit_fan_work.update(lit_fan_work_params)

    if @lit_fan_work.save
      redirect_to @lit_fan_work
    else
      render :edit
    end
  end

  # Namespace this
  def destroy
    @lit_fan_work = LitFanWork.find(params[:id])
    @lit_fan_work.destroy
    flash[:notice] = "Work deleted."
    redirect_to lit_fan_works_path
  end

  private

  def lit_fan_work_params
    params.require(:lit_fan_work).permit(:title, :lit_fan_author_name, :lit_fan_author_id, lit_fan_genre_ids:[], lit_fan_genres_attributes: [:name])
    # binding.pry
  end
end
