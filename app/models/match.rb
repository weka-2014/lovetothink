class Match < ActiveRecord::Base
	
	def formatted
		user = User.find(match_user_id)
		{
			"id" => user.id, 
			"name" => user.name, 
			"blurb" => user.blurb, 
			"image_url" => user.image_url, 
			"twitter_percent" => "#{(twitter_percent*100).to_i}%", 
			"youtube_percent" => "#{(youtube_percent*100).to_i}%", 
			"soundcloud_percent" => "#{(soundcloud_percent*100).to_i}%", 
			"overall_percent" => "#{(overall_percent*100).to_i}%" 
		}
	end

end
