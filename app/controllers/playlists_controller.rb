class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.find_current(current_user.id)
  end

  def show
    @playlist = Playlist.find params[:id]
    @playlist_songs = PlaylistSong.by_playlist(@playlist.id)
  end

  def new
  	@playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id
    if @playlist.save
    	redirect_to @playlist
    else
    	render :new
    end
  end

  def edit
    @playlist = Playlist.find params[:id]
  end

  def update
    @playlist = Playlist.find params[:id]
    if @playlist.update_attributes(playlist_params)
      redirect_to @playlist, :notice => "Your playlist has been renamed."
    else
      render :edit, :notice => "Sorry, please try again." 
    end
  end

  def destroy
    @playlist = Playlist.find params[:id]
    @playlist.destroy
    redirect_to playlists_path, :notice => "Your playlist has been deleted."
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
