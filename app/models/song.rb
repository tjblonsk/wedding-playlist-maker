class Song < ActiveRecord::Base
	validates :external_id, uniqueness: true
	has_many :playlist_songs
	has_many :playlists, through: :playlist_songs
	has_one :vote
end
