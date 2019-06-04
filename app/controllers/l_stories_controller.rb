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
    respond_to do |f|
      f.html( @l_story )
      f.json( render :json => @create )
    end
  end

  def show
    @l_story = LStory.find(params[:id])
    @l_stories = LStory.all
    @ls_comment = @l_story.ls_comments.build
    # .create(params[:content])
    @ls_user = @ls_comment.build_ls_user
    #for belongs_to relationship
    render :layout => 'navbar_on_top'
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
    #notice that l_story doesn't have anything about user in its params; it was built onto the @ls_comment that was already built with @l_story
  end
  
  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end