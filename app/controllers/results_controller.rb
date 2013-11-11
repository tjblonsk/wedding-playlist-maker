class ResultsController < ApplicationController
  def index
  	#@results = Vote.find_by_sql "Select *, count(cast_vote) AS votings FROM votes GROUP BY song_id ORDER BY votings DESC"
  	@results = Vote.find_by_sql "Select *, count(cast_vote) AS votings FROM votes WHERE cast_vote = 2 GROUP BY song_id ORDER BY votings DESC"
  end
end
