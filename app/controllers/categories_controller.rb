class CategoriesController < ApplicationController

  	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def show
		@category = Category.find(params[:id])
		
		@skill = @category.skills.new
	end

	# def create
	# 	@category = Category.create(params[:category].permit(:category_name))
	# 	redirect_to :action => "show", :id =>@category._id
	# end

	def update
		Skill.all.each do |s|
			params.each do |key, value|
				if key[0]=="m"
					if s.id.to_s ==key[1..key.length-1]
						m = s.mentors.new
						m.user = current_user
						m.save
						redirect_to mentor_path
					end
				elsif key[0]=="l"
					if s.id.to_s ==key[1..key.length-1]
						l = s.learners.new
						l.user = current_user
						l.save
						redirect_to learner_path
					end
				end
			end
		end
		# redirect_to :controller => 'users', :action => 'show', :id => @user._id
	end

	def destroy
		Category.find(params[:id]).destroy
		redirect_to categories_url
	end
end
