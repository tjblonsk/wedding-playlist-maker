class PlaylistSong < ActiveRecord::Base
	belongs_to :playlist
	belongs_to :song
	delegate :name, :artist, :album, :duration, :thumb60, :audio, :to => :song, :allow_nil => true
end
