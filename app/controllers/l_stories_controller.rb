class LStoriesController < ApplicationController
  before_action :require_login

  def index
    @l_stories = LStory.all
  end
 
  def new
    @l_story = LStory.new
  end

  def create  
    @l_story = LStory.new(l_story_params)
    if @l_story.valid?
      @l_story.save
      redirect_to l_story_path(@l_story)
    else
      render :new
    end
  end

  def show
      @l_story = LStory.find(params[:id]) 
      # @pledges = Pledge.where(:l_story_id == @l_story.id)
  end

  def edit
      @l_story = LStory.find(params[:id])
  end

  def update
    @l_story = LStory.update(l_story_params)
    @l_story.save
    redirect_to l_story_path(@l_story)
  end

  private

  def l_story_params
    params.require(:l_story).permit(:title, :content, o_genre_ids:[], o_genres_attributes: [:name])
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end
