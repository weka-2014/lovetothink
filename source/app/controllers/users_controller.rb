class UsersController < ApplicationController

	before_action :authenticate_user!

	def update_info 
		current_user.load_tweets
		current_user.load_videos
		redirect_to '/personal'
	end

end

# user will need tweets