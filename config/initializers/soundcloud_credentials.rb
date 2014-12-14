SOUNDCLOUD = SoundCloud.new(:client_id => "ebe2d1362a92fc057ac484fcfb265049")

# tracks = SOUNDCLOUD.get("/users/nu-yi/favorites")

# tracks.each do |track|
# 	image_url = track.artwork_url
# 	description = track.description
# 	genre = track.genre	
# 	title = track.title
# 	track_url = track.permalink_url
# 	author = track.user.username

# 	tag_string = track.tag_list
# 	strings = tag_string.scan(/["][^"]+["]/)
# 	strings.each do |string|
# 		tag_string.gsub!(string,"")
# 		string.gsub!("\"","")
# 	end
# 	words = tag_string.split(" ")
# 	tags = words.concat(strings)

# 	hash = { image_url: image_url, description: description, genre: genre, track_url: track_url, tags: tags, title: title, author: author }
# 	p hash
# end

