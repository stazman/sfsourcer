class LitFanAuthorsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]
  
  def alphabetized
      @author_most_works = LitFanAuthor.alphabetized.each {|name| name}
  end
        

      
      # @lit_fan_author = LitFanAuthor.find(params[:id])
      # @lit_fan_works = @lit_fan_author.lit_fan_works.find_by(id: params[:lit_fan_work_id])
      
      # @lit_fan_author = LitFanAuthor.author_most_works(2)

      # @lit_fan_author = LitFanAuthor.author_most_works(2)
      # @lit_fan_authors = LitFanAuthor.all


    # @lit_fan_authors = LitFanAuthor.author_most_works
  end
    
  def index
    @lit_fan_authors = LitFanAuthor.search(params[:term])

    # @lit_fan_authors = LitFanAuthor.all
    # @tasks = Task.search(params[:term])
    # @lit_fan_works = @lit
  end

  def show
    @lit_fan_author = LitFanAuthor.find(params[:id])
  end

  def new
    @lit_fan_author = LitFanAuthor.new
  end

  def create
    @lit_fan_author = LitFanAuthor.new(lit_fan_author_params)
  
    # @lit_fan_author.lit_fan_works.build
      # = LitFanWork.where(lit_fan_author_id: params[:lit_fan_author_id])

    if @lit_fan_author.save
      redirect_to @lit_fan_author
    else
      render :new
    end
  end

  def edit
    @lit_fan_author = LitFanAuthor.find(params[:id])
  end

  def update
    @lit_fan_author = LitFanAuthor.find(params[:id])

    @lit_fan_author.update(lit_fan_author_params)

    if @lit_fan_author.save
      redirect_to @lit_fan_author
    else
      render :edit
    end
  end

  # Namespace destroy
  def destroy
    @lit_fan_author = lit_fan_author.find(params[:id])
    @lit_fan_author.destroy
    flash[:notice] = "Author deleted."
    redirect_to lit_fan_authors_path
  end

  private

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end

  def lit_fan_author_params
    params.require(:lit_fan_author).permit(:name, :term)
  end
end
