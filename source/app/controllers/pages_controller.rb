class PagesController < ApplicationController

	def home 
		if current_user
			redirect_to '/users/update_info'
		else
			redirect_to '/users/sign_in'
		end
	end

	def personal
		
		@personal_info = current_user.personal_info
	end

	def profile
	end

end