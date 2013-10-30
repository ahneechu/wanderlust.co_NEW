class MentorsController < ApplicationController

	def index
		@mentors = Mentor.all
		@mentor = Mentor.new
	end

	def show
		@mentor = Mentor.find(params[:id])
	end

	def create
		m = Mentor.create(params[:id].permit(:name, :email, :skill, :description))
		# Make the currently logged-in user a member of the group
		m.musers << current_user
		redirect_to action:"index"
	end

	def update
		# This digs through all the groups, and compares each one against
		# all incoming params to see if one is named grp#### where ####
		# matches the ID of the group.  If so, it marks the boolean variable
		# is_member.
		# Then it tests to see if this user is a part of the group, and if
		# they should be it makes it happen, or if they should be removed
		# then it does that also.
		Mentor.all.each do |m|
			is_member = false	# Start by pessimistically expecting we're not a member
			params.each do |key, value| 
			  if key.index("grp") == 0	# Make sure it's a group checkbox
			   	if m.id.to_s == key[3..key.length-1]	# Test this group's ID against the checkbox name
			   		is_member = true	# Got a match!
			   	end
			  end
			end
			# Do we need to remove them?
		   	if(m.gusers.include?(current_user) && ! is_member)
		   		m.musers.delete(current_user)
		   	end
		   	# Need to add them?
		   	if(! m.musers.include?(current_user) && is_member)
		   		m.musers << current_user
			end
		end
		#Head back into the index view
		redirect_to mentors_url
	end

end
