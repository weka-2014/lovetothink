class PagesController < ApplicationController

	def home
		if current_user
			if session[:updated]
				# better to used the named routes here like users_update_info_url
				redirect_to '/personal'
			else
				redirect_to '/users/update_info'
			end
		else
			session[:updated] = false
			redirect_to '/users/sign_in'
		end
	end

	def personal
		@match_data = current_user.match_data_formatted
		@personal_info = current_user.personal_info
	end

	def profile
		id = params[:id] #no need for this ok to put in line 28
		user = User.find(id)
		@personal_info = user.personal_info
	end

end
