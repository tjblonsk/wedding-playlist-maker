class VotesController < ApplicationController
  def index
    @playlists = Playlist.find_current(current_user.id)
    @playlist_songs = PlaylistSong.by_playlist(@playlists).collect {|x| x.song_id}
    @eligible_songs = Vote.find_eligible(@playlist_songs)
    @eligible_songs.uniq! {|s| s.song_id }
    @paged_songs = Kaminari.paginate_array(@eligible_songs.reverse!).page(params[:page]).per(10)
    @current_page = params[:page].to_i
  end

  def create
    @vote = Vote.find_create(vote_params[:song_id], current_user.id)
    @vote.cast_vote = vote_params[:vote]
    anchor_id = vote_params[:song_id]
    curr_page = vote_params[:curr_page].to_i
  	if @vote.save
  		redirect_to votes_path(anchor: anchor_id, page: curr_page)
  	else
  		redirect_to :back, :notice => "Sorry, try again."
  	end
  end

  private
  def vote_params
    params.require(:vote).permit(:song_id, :vote, :curr_page)
  end
end
