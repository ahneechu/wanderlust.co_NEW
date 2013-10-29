class AuthenticationsController < ApplicationController
	#only call into
	before_action :authenticate_user, only: [:destroy]


	def new
		# are they already logged in?
		if current_user #they are!  can't create them again
			redirect_to root_path
		else
			@user = User.new

			render :new  # i dont know if this function actually works!
		end
	end	


	def create
			user = User.find_by(email: params[:user][:email])
		# if user
		if user != nil
			#authenticate user
			if user.authenticate(params[:user][:password])
				session[:user_id] = user.id
				redirect_to root_url
			end
		else
			# flash.now.alert = "Unable to sign you in."
			# render :new
			redirect_to new_user_path
		end
		# end
	end

	def destroy
		session[:user_id] = nil
		redirect_to help_path
		
	end

end