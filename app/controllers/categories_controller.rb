class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def new 
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if params[:commit] == "Back"
			redirect_to categories_path
		elsif @category.save
			flash[:success] = "Category was created successfully!"
			redirect_to categories_path
		else
			render :new
		end
	end

	def show 
		@category = Category.find(params[:id])
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

end