class MentorsController < ApplicationController

	def index
		@mentors = Mentor.all
	end

	def show
		@mentor = Mentor.find(params[:id])
	end

	def edit
		@mentor = Mentor.find(params[:id])
	end

	def update
		@mentor = Mentor.find(params[:id])

		if @mentor.update_attributes(params[:mentor].permit(:notes))
			redirect_to action: 'show', id: @mentor
		else
			render 'edit'
		end
	end

end
