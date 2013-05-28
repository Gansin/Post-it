class UsersController < ApplicationController

  # new user form
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:notice] = "Thanks for Registering!"
  		redirect_to root_path
  	else
  		render :new
  	end
  end
end