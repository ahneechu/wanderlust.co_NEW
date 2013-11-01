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

	def destroy
		Category.find(params[:id]).destroy
		redirect_to categories_url
	end
end
