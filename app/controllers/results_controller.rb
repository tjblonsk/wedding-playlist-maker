class ResultsController < ApplicationController
  def index
  	vote_category = 1
  	@results = Vote.find_by_sql "Select *, count(cast_vote) AS votings FROM votes WHERE cast_vote = #{vote_category} GROUP BY song_id ORDER BY votings DESC"
  end
end
