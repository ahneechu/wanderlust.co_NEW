class CategoriesController < ApplicationController
	# before_action :set_item, only: [:show, :edit, :update, :destroy]

	# def index #new
		# @show_hidden = params[:show_hidden]

  #   if @show_hidden == 'true'
  #     @categories = Category.all
  #   else
  #     @categories = Category.where(active: true)
  #   end
  # end

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

	# test 
	# def reloadindex
 #  		redirect_to categories_path({:category => params[:id]})
	# end
	

	# def create
	# 	@category = Category.create(params[:category].permit(:category_name))
	# 	redirect_to :action => "show", :id =>@category._id
	# end

	def destroy
		Category.find(params[:id]).destroy
		redirect_to categories_url
	end
end
