class PagesController < ApplicationController

	def home
		if current_user
			redirect_to '/users/update_info'
		else
			redirect_to '/users/sign_in'
		end
	end

	def personal
		user_data = User.data(current_user)
		#send user_data to tye with httparty
		#get user_data back from tye from httparty
		#arrange user_ids and percents in descending order
		#send to view!
		raw_data = User.drunk_tye_matcher(current_user)
		@match_data = User.drunk_tye_processor(raw_data)
		@personal_info = current_user.personal_info
	end

	def profile
		id = params[:id]
		user = User.find(id)
		@personal_info = user.personal_info
	end

end

