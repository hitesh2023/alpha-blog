class UsersController < ApplicationController

	def index
		@users = User.all.order('created_at ASC')
	end

	def new
		@user = User.new 
	end

	def create
		@user = User.new(user_params)

		if params[:commit] == 'Back'
			redirect_to articles_path
		elsif @user.save
			flash[:success] = "Welcome to Alpha Blog #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def show 
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end


	def update	
		@user = User.find(params[:id])
		if params[:commit] == 'Back'
			redirect_to articles_path
		elsif @user.update(user_params)
			flash[:success] = "Your account was successfully updated"
			redirect_to articles_path
		else
			render 'edit'
		end
	end


	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

end