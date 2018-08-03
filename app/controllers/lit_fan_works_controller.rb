class LitFanWorksController < ApplicationController
  
  def new
    if params[:lit_fan_author_id] && !LitFanAuthor.exists?(id: params[:lit_fan_author_id])
      redirect_to lit_fan_author_path, alert: "Artist not found"
    else
      @lit_fan_work = LitFanWork.new(lit_fan_author_id: params[:lit_fan_author_id])
    end
  end

  def index
    if params[:lit_fan_author_id]
      # NEED THIS TO CHECK BECAUSE NEED TO ... WHY DO WE NEED THIS IF #NEW HAS THIS?
      # THIS IS DONE BECAUSE BOTH AUTHOR AND SONG ARE LISTED IN THE INDEX; PRESUMABLY NOT NECESSARY IF ONLY ONE MODEL INVOLVED?
      @lit_fan_author = LitFanAuthor.find_by(id: params[:lit_fan_author_id])
      if @lit_fan_author.nil?
        redirect_to lit_fan_author_path, alert: "Artist not found"
      else
        @lit_fan_works = @lit_fan_author.songs
      end
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.songs.find_by(id: params[:id])
      if @song.nil?
        redirect_to artist_songs_path(@artist), alert: "Song not found"
      end
    else
      @song = Song.find(params[:id])
    end
  end

  def create
    #create gives strong paramaters to instance made by the #new action here
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    if params[:artist_id]
      artist = Artist.find_by(id: params[:artist_id])
      if artist.nil?
        redirect_to artists_path, alert: "Artist not found"
      else
        @song = artist.songs.find_by(id: params[:id])
        redirect_to artist_songs_path(artist), alert: "Song not found." if @song.nil?
      end
    else
      @song = Song.find(params[:id])
    end
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :artist_id)
    # binding.pry
  end
end
