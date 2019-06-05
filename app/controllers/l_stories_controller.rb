class LStoriesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

  def index
    @l_stories = LStory.all.reverse
  end

  def new
    @l_story = LStory.new
    render :layout => 'navbar_on_top'
  end

  def create
    @l_story = LStory.create(l_story_params)
      render :json => @l_story
  end

  def show
    @l_story = LStory.find(params[:id])
    @ls_comment = @l_story.ls_comments.build
    @ls_user = @ls_comment.build_ls_user
    respond_to do |f|
      f.html { render :show }
      f.json { render :json => @l_story }
    end
    # render :layout => 'navbar_on_top'
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
    params.require(:l_story).permit(:title, :content)
  end
  
  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end