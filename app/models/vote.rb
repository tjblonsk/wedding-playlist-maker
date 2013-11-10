class Vote < ActiveRecord::Base
	belongs_to :song
	belongs_to :user
	
	def self.find_create(song_id, user_id)
    	where(song_id: song_id, user_id: user_id).first_or_create
  	end

  	def self.find_current_vote(song_id, user_id)
  		current_vote = self.where(song_id: song_id, user_id: user_id).first
  	end

end
