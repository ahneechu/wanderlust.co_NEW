class CategoriesController < ApplicationController
	before_action :set_item, only: [:show, :edit, :update, :destroy]

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
		puts "*" * 100
		puts @category
		# @skill = @category.skills.new
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

def create #new 
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Skill was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @skill }
      else
        format.html { render action: 'new' }
        # format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end


  def update #new
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Item was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        # format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end