class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
	@user = User.create(params[:user].permit(:email, :password, :password_confirmation))
	redirect_to root_path  #this redirects to homepage -- but this should redirect to signed_in homepage!
  end

  


  
end