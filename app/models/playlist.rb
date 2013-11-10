class Playlist < ActiveRecord::Base
	validates_presence_of :name, presence: true
	belongs_to :user
	has_many :playlist_songs, dependent: :destroy
	has_many :songs, through: :playlist_songs

	def self.find_current(user_id)
		where(user_id: user_id).order(updated_at: :desc).to_a
	end
end
