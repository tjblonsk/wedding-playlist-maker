class VotesController < ApplicationController
  def index
  	@playlist_song = PlaylistSong.select(:song_id).distinct
  end

  def create
  	
  end

end
