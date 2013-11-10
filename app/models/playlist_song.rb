class PlaylistSong < ActiveRecord::Base
	belongs_to :playlist
	belongs_to :song
	delegate :name, :artist, :album, :duration, :thumb60, :audio, :to => :song, :allow_nil => true
	delegate :user_id, :to => :playlist, :allow_nil => true

	after_save :upvote_song

	def self.find_songs(playlists)
		where.not(playlist_id: playlists).select(:song_id).distinct.order(updated_at: :desc)
	end

	def upvote_song
		user_id = playlist.user_id
		Vote.create!(:user_id => user_id, :song_id => song_id, :cast_vote => 1)
	end
end
