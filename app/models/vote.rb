class Vote < ActiveRecord::Base
	belongs_to :song
	
	def self.find_or_create_by(song_id)
    	where(song_id: song_id).first_or_create
  	end

  	def cast_vote(vote)
  		case vote
  		when "love"
  			self.love += 1
  		when "hate"
  			self.hate += 1
  		else
  		end
  	end
end
