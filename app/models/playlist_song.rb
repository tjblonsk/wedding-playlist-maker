class PlaylistSong < ActiveRecord::Base
	belongs_to :playlist
	belongs_to :song
	delegate :name, :artist, :album, :duration, :thumb60, :audio, :to => :song, :allow_nil => true

	def self.find_songs(playlists)
		where.not(playlist_id: playlists).select(:song_id).distinct.order(updated_at: :desc)
	end
end
