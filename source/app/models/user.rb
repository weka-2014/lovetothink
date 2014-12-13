class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #  :trackable, :rememberable, :recoverable,
  devise :database_authenticatable, :registerable, :validatable

  has_many :tweets
  has_many :videos

  def load_tweets
  	tweet_data = TWITTER.user_timeline(twitter_username)
  	tweet_data.each do |tweet_object|
  		tweet = tweets.create(content: tweet_object.text)
  		tweet_object.hashtags.each do |hashtag_object|
  			if hashtag_object.text
	  			tweet.hashtags.create(text: hashtag_object.text)
	  		end
  		end
  	end
  end

  def load_videos
    activity = YOUTUBE.activity(youtube_username)
    video_ids = activity.map { |action| action.video_id }
    video_data = video_ids.map { |video_id| YOUTUBE.video_by(video_id) }
    video_data.each do |video_object|
      url = video_object.player_url 
      title = video_object.title
      description = video_object.description
      label = video_object.categories.map { |category| category.label }.first
      author = video_object.author.name
      video = videos.create(url: url, title: title, description: description, label: label, author: author)
      video_object.keywords.each do |keyword|
        video.keywords.create(name: keyword)
      end
    end
  end

  def personal_info
  	{user_id: id, name: name, blurb: blurb, image_url: image_url, tweets: tweets, videos: videos}
  end

  def self.data(current_user) 

  	current_user_tweet_data = current_user.tweets.map do |tweet|
  		hashtags = tweet.hashtags.map do |hashtag|
  			hashtag.text
  		end
  		{"content" => tweet.content, "hashtags" => hashtags}
  	end 

    current_user_video_data = current_user.videos.map do |video|
      keywords = video.keywords.map do |keyword|
        keyword.name
      end
      {"title" => video.title, "description" => video.description, "label" => video.label, "author" => video.author, "keywords" => keywords}
    end

  	current_user_data = {"user_id" => current_user.id, "tweets" => current_user_tweet_data, "videos" => current_user_video_data}

  	match_data = User.where.not(id: current_user.id).map do |user|

      unless user.id == current_user.id  

    		user_tweet_data = user.tweets.map do |tweet|
    			hashtags = tweet.hashtags.map do |hashtag|
    				hashtag.text
    			end
    			{"content" => tweet.content, "hashtags" => hashtags}
    		end

        user_video_data = user.videos.map do |video|
          keywords = video.keywords.map do |keyword|
            keyword.name
          end
          {"title" => video.title, "description" => video.description, "label" => video.label, "author" => video.author, "keywords" => keywords}
        end

    		{"user_id" => user.id, "tweets" => user_tweet_data, "videos" => user_video_data}

      end

  	end

  	{"user" => current_user_data, "matches" => match_data}

  end

  def self.drunk_tye_matcher(current_user)
  	data = User.where.not(id: current_user.id).map do |user|
      twitter_percent = rand(0.0..1.0)
      youtube_percent = rand(0.0..1.0)
      overall_percent = (twitter_percent + youtube_percent) / 2.0
  		{"user_id" => user.id, "twitter_percent" => twitter_percent, "youtube_percent" => youtube_percent, "overall_percent" => overall_percent}
  	end
  	data = data.sort_by { |k| p k["overall_percent"] }.reverse
	end

  def self.drunk_tye_processor(match_data)
  	match_data.map do |match|
  		user_id = match["user_id"]
      twitter_percent = "#{(match["twitter_percent"]*100).to_i}%"
      youtube_percent = "#{(match["youtube_percent"]*100).to_i}%"
      overall_percent = "#{(match["overall_percent"]*100).to_i}%"
 			user = User.find(user_id)
  		{"id" => user.id, "name" => user.name, "blurb" => user.blurb, "image_url" => user.image_url, "twitter_percent" => twitter_percent, "youtube_percent" => youtube_percent, "overall_percent" => overall_percent }
  	end
  end

end
