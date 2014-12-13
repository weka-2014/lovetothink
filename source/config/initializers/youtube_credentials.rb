require 'youtube_it'

client = YouTubeIt::Client.new(:dev_key => "AI39si5Dgg_9QnLn4JihtOcgxLKti3okDDvvulrnOAeQ8rArYrD6gFn0ALhi_T124PxthsSGtxTEhwhiKNrzpygcENYakw7tVA")

# activity = client.activity("yoojcheme")

# video_ids = activity.map { |action| action.video_id }

# videos = video_ids.map { |video_id| client.video_by(video_id) }

# data = videos.map do |video|
# 	url = video.player_url #dont send this to tye
# 	title = video.title
# 	description = video.description
# 	keywords = video.keywords
# 	label = video.categories.map { |category| category.label.first }
# 	author = video.author.name
# 	{"url" => url, "title" => title, "description" => description, "keywords" => keywords, "label" => label, "author" => author}
# end

# puts data

