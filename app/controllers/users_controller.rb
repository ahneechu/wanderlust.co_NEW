class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    
  end

  def new
  	@user = User.new
  end

  def create
	@user = User.create(params[:user].permit(:email, :password, :password_confirmation))

  user = User.find_by(email: params[:user][:email])
	 if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user
    end
  end

  


  
end