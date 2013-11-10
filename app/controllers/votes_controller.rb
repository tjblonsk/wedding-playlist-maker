class VotesController < ApplicationController
  def index
    @playlists = Playlist.find_current(current_user.id)
    #@playlist_song = PlaylistSong.find_songs(@playlists)
    @votes = Vote.all
  end

  def create
    @vote = Vote.find_create(vote_params[:song_id], current_user.id)
    @vote.cast_vote = vote_params[:vote]
  	if @vote.save
  		redirect_to :back
  	else
  		redirect_to :back, :notice => "Sorry, try again."
  	end
  end

  private
  def vote_params
    params.require(:vote).permit(:song_id, :vote)
  end
end
