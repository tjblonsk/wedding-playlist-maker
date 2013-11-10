class Song < ActiveRecord::Base
	validates :external_id, uniqueness: true
	has_many :playlist_songs
	has_many :playlists, through: :playlist_songs
	has_many :votes

	def convert_time
		Time.at(duration/1000).strftime("%M:%S")
	end
end

