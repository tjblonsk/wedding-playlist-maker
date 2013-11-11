class VotesController < ApplicationController
  def index
    @playlists = Playlist.find_current(current_user.id)
    @playlist_songs = PlaylistSong.by_playlist(@playlists).collect {|x| x.song_id}
    @eligible_songs = Vote.find_eligible(@playlist_songs)
    @eligible_songs.uniq! {|s| s.song_id }
    @paged_songs = Kaminari.paginate_array(@eligible_songs).page(params[:page]).per(10)
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
