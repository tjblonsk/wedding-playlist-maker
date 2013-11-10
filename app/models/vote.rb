class Vote < ActiveRecord::Base
	belongs_to :song
	belongs_to :user

  delegate :name, :artist, :album, :duration, :thumb60, :audio, :to => :song, :allow_nil => true
	
	def self.find_create(song_id, user_id)
    	where(song_id: song_id, user_id: user_id).first_or_create
  	end

  	def self.find_current_vote(song_id, user_id)
  		current_vote = self.where(song_id: song_id, user_id: user_id).first
  	end

  	def self.display(num)
  		case num
  		when 1
  			return "yes"
  		when 2
  			return "no"
  		else
  			return "undecided"
  		end
  	end
end
