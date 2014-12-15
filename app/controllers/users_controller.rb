class UsersController < ApplicationController

	before_action :authenticate_user!

	def update_info 
	  current_user.load_tweets
	  current_user.load_videos
	  current_user.load_tracks
	  current_user.load_profile_img
	  redirect_to '/personal'
	end

end