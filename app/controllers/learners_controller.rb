class LearnersController < ApplicationController

	def index
		@learners = Learner.all
	end

	def show
		@learner = Learner.find(params[:id])
	end

end

	