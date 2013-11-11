class ResultsController < ApplicationController
  def index
  	@yes_votes = Vote.calculate_vote(1)
  	@no_votes = Vote.calculate_vote(2)
  end
end
