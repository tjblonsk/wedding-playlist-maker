class Song < ActiveRecord::Base
	validates :external_id, uniqueness: true
	has_many :playlist_songs
	has_many :playlists, through: :playlist_songs
	has_many :votes

	after_create :create_vote

	def create_vote
		Vote.create!(:song_id => id)
	end
end
