class Vote < ActiveRecord::Base
  	belongs_to :song
  	belongs_to :user

    delegate :name, :artist, :album, :duration, :thumb60, :audio, :to => :song, :allow_nil => true
  	
  	def self.find_create(song_id, user_id)
    	where(song_id: song_id, user_id: user_id).first_or_create
  	end

    def self.find_eligible(user_songs)
      where.not(song_id: user_songs).to_a
    end

  	def self.find_current_vote(song_id, user_id)
  		current_vote = self.where(song_id: song_id, user_id: user_id).first
  	end

    def self.calculate_vote(vote_category)
      find_by_sql "Select song_id, count(cast_vote) AS votings FROM votes WHERE cast_vote = #{vote_category} GROUP BY song_id ORDER BY votings DESC"
    end

    #change this
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
