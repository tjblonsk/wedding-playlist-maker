class PlaylistSongsController < ApplicationController
	def create
		@playlist_song = PlaylistSong.new(playlistsong_params)
		if @playlist_song.save
      			redirect_to playlist_path(@playlist_song.playlist_id)
    		else
      			redirect_to :back, notice: "Sorry, please try again."
      		end
	end

	def destroy
		@playlist_song = PlaylistSong.find(params[:id])
		@playlist_song.destroy
		redirect_to playlist_path(@playlist_song.playlist_id), :notice => "Your song has been deleted."
	end

	private
  	def playlistsong_params
    		params.require(:playlist_song).permit(:playlist_id, :song_id)
  	end
end
