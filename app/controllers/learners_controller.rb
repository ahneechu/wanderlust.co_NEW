class LearnersController < ApplicationController

	def index
		@learners = Learner.all
	end

	def show
		@learner = Learner.find(params[:id])
	end

	def edit
		@learner = Learner.find(params[:id])
	end

	def update
		@learner = Learner.find(params[:id])

		if @learner.update_attributes(params[:learner].permit(:notes))
			redirect_to action: 'show', id: @learner
		else
			render 'edit'
		end
	end

end

	