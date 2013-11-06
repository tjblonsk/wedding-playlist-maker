class PlaylistSongsController < ApplicationController
	def create
		safe_playlistsong_params = params.require(:playlist_song).permit(:playlist_id, :song_id)
		@playlist_song = PlaylistSong.new safe_playlistsong_params
		if @playlist_song.save
      		redirect_to playlist_path(@playlist_song.playlist_id)
    	else
      		#do nothing
      	end
	end

	def destroy
		@playlist_song = PlaylistSong.find(params[:id])
		@playlist_song.destroy
		redirect_to playlist_path(@playlist_song.playlist_id), :notice => "Your song has been deleted."
	end
end
