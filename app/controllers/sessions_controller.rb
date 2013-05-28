class SessionsController < ApplicationController
	# Get /login
	def new
	end

	# POST /login
	def create
		# 1. get the user obj
		# 2. see if password matches that user obj, using the authenticate method
		# below is aerial syntax
		user = User.where(username: params[:username]).first

		if user && user.authenticate(params[:password])
			# password matches
			# then store id into session - this is key
			session[:user_id] = user.id
			flash[:notice] = "Welcome, you're logged in."
			redirect_to root_path
		else
			flash[:error] = "there's something wrong with your username or password."
			redirect_to new_user_path
		end
	end

def destroy
	session[:user_id] = nil
	flash[:notice] = "You are logged out"
	redirect_to root_path
end


end
