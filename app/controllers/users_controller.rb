class UsersController < ApplicationController

	before_action :authenticate_user!

	def update_info
		# This should be either of the two:
		# current_user.fetch_social_data
		# SocialData.load_for(current_user)
	  current_user.load_tweets
	  current_user.load_videos
	  current_user.load_tracks
	  current_user.load_profile_img
	  redirect_to '/users/update_matches'
	end

	def update_matches
		#prepare user data for tye
		user_data = User.data(current_user)
		#send user_data to tye with httparty
		raw_match_data = User.drunk_tye_matcher(current_user)
		#get user_data back from tye from httparty

		#update database with raw_match_data
		current_user.load_match_data(raw_match_data)

		session[:updated] = true
		redirect_to '/'
	end

end
