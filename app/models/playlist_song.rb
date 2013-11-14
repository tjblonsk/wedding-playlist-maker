class PlaylistSong < ActiveRecord::Base
	belongs_to :playlist
	belongs_to :song
	delegate :name, :artist, :album, :duration, :thumb60, :thumb100, :audio, :to => :song, :allow_nil => true
	delegate :user_id, :to => :playlist, :allow_nil => true

	after_save :upvote_song

	def self.by_playlist(playlist_id)
		where(playlist_id: playlist_id).order(updated_at: :desc).to_a
	end

	def self.by_song(song_id)
		where(song_id: song_id).order(updated_at: :desc).to_a
	end

	def upvote_song
		user_id = playlist.user_id
		Vote.create!(:user_id => user_id, :song_id => song_id, :cast_vote => 1)
	end
end
