class UsersController < ApplicationController

	before_action :authenticate_user!

	def update_info 
		current_user.load_tweets
		redirect_to '/personal'
	end

end

# user will need tweets