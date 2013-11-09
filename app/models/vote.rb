class Vote < ActiveRecord::Base
	belongs_to :song
	
	def self.find_or_create_by(song_id)
    	where(song_id: song_id).first_or_create
  	end
end
