class SkillsController < ApplicationController
	def index
		@skills = Skill.all

	end

	def new
		@skill = Skill.new
	end

	def show
		@skill = Skill.find(params[:id])
	end

	def create
		@skill = Skill.create(params[:skill].permit(:skill_name, :category_id, :skill_description))
		redirect_to :action => "show", :id =>@skill._id
	end

	def edit
		@skill = Skill.find(params[:id])
	end

	def update
		@skill = Skill.find(params[:id])

		if @skill.update_attributes(params[:skill].permit(:skill_name, :skill_description))
			redirect_to action: 'show', id: @skill
		else
			render 'edit'
		end
	end

	def destroy
		Skill.find(params[:id]).destroy
		redirect_to skills_url
	end

end

