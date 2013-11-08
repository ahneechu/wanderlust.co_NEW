class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # i dont know if this works
    # @mentor = User.mentor.find_by(params[:user])
    # @learner = User.learner.find_by(params[:user])
  end

  def new
  	@user = User.new
  end

  def create
	@user = User.create(params[:user].permit(:name, :email, :password, :password_confirmation))

  user = User.find_by(email: params[:user][:email])
	 if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user].permit(:user_name, :user_email, :user_password, :user_password_confirmation))
      redirect_to action: 'show', id: @user
    else
      render 'edit'
    end
  end
  


  
end