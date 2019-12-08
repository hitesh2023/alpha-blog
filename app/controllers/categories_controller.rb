class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update]
	before_action :require_admin, only: [:new, :create, :edit, :update]

	def index
		@categories = Category.paginate(page: params[:page] , per_page: 4)
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
		@category_articles = @category.articles.paginate(page: params[:page], per_page: 3)
	end

	def edit
	end

	def update
		if params[:commit] == "Back"
			redirect_to categories_path
		elsif @category.update(category_params)
			flash[:success] = "Category name was updated successfully!"
			redirect_to category_path(@category)
		else 
			render :edit
		end
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name)
	end

	def require_admin
		if !logged_in? || (logged_in? and !current_user.admin?)
			flash[:danger] = "Only admins can perform that action"
			redirect_to categories_path 
		end
	end
end