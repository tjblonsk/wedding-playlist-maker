class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.find_all_by_user_id(current_user.id)
  end

  def show
    @playlist = Playlist.find params[:id]
    @playlist_songs = PlaylistSong.find_all_by_playlist_id(@playlist.id)
  end

  def new
  	@playlist = Playlist.new
  end

  def create
  	safe_playlist_params = params.require(:playlist).permit(:name)
    @playlist = Playlist.new safe_playlist_params.merge(:user_id => current_user.id)

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
    safe_playlist_params = params.require(:playlist).permit(:name)
    @playlist = Playlist.find params[:id]
    if @playlist.update_attributes(safe_playlist_params)
      redirect_to @playlist
    else
      #render :new
    end
  end

  def destroy
    @playlist = Playlist.find params[:id]
    @playlist.destroy
    redirect_to playlists_path, :notice => "Your playlist has been deleted."
  end
end
