class SkillsController < ApplicationController
	def index
		@skills = Skill.all

	end

	def new
		@skill = Skill.new
	end

	def show
		@skill = Skill.find(params[:id])
		# this doesnt work.  how do i show mentor/learner info?
		# @mentor = Skill.mentor.find(params[:skill])
		# @learner = Skill.learner.find(params[:skill])
	end

	def create
		@skill = Skill.create(params[:skill].permit(:skill_name, :category_id, :skill_description))
		
			if params[:skill][:m_or_l] == 'mentor'
				m = @skill.mentors.new(:notes => params[:skill][:notes])
				m.user = current_user
				m.save
			else
				l = @skill.learners.new(:notes => params[:skill][:notes])
				l.user = current_user
				l.save
			end

		redirect_to :controller => 'categories', :action => 'show', :id => params[:skill][:category_id]
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
		redirect_to :back
		# redirect_to skills_url
	end

end

