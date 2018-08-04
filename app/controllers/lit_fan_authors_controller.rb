class LitFanAuthorsController < ApplicationController
  def index
    @lit_fan_authors = LitFanAuthor.all
  end

  def show
    @lit_fan_author = LitFanAuthor.find(params[:id])
  end

  def new
    @lit_fan_author = LitFanAuthor.new
  end

  def create
    @lit_fan_author = LitFanAuthor.new(lit_fan_author_params)

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

  def lit_fan_author_params
    params.require(:lit_fan_author).permit(:name)
  end
end
