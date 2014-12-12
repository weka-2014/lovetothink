class PagesController < ApplicationController

	def home 
		if current_user
			redirect_to '/personal'
		else
			redirect_to '/users/sign_in'
		end
	end

	def personal
	end

	def profile
	end

end