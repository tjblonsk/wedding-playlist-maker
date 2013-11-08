class VotesController < ApplicationController
  def index
  	@playlist_song = PlaylistSong.select(:song_id).distinct.order(updated_at: :desc)
    @votes = Vote.all
  end

  def create
  	@vote = Vote.find_or_create_by(vote_params[:song_id])
    @vote.cast_vote(vote_params[:vote])
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
