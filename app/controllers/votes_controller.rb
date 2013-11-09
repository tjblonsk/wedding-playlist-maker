class VotesController < ApplicationController
  def index
    @playlists = Playlist.find_all_by_user_id(current_user.id)
  	@playlist_song = PlaylistSong.where.not(playlist_id: @playlists).select(:song_id).distinct.order(updated_at: :desc)
  end

  def create
  	@vote = Vote.find_or_create_by(vote_params[:song_id])
  	if @vote.save
  		redirect_to :back,  :notice => "Thanks for your vote!"
  	else
  		redirect_to :back, :notice => "Sorry, try again."
  	end
  end

  private
  def vote_params
    params.require(:vote).permit(:song_id, :vote)
  end
end
