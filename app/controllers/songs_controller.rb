class SongsController < ApplicationController
  def index
    if params[:q]
      @query = params[:q]
      @search_results = true
    end
    @results = ITunesSearchAPI.search(:term => @query, :country => "US", :media => "music", :limit => 20)
  end

  def show
    @song = Song.find params[:id]
    @song_length = Time.at(@song.duration/1000).strftime("%M:%S")
    @playlist_song = PlaylistSong.new
    @playlists = Playlist.where(user_id: current_user.id).order(updated_at: :desc)
  end

  def create
    @song = Song.new(song_params)
  	if @song.save
  		redirect_to @song
  	else
  		redirect_to songs_path
      flash[:notice] = "Oops, song cannot be displayed. Try again."
  	end
  end

  private
  def song_params
    params.permit(:external_id, :name, :artist, :album, :duration, :thumb100, :thumb60, :itunes, :audio)
  end
end
