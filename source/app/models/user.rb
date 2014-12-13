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
  	{user_id: id, name: name, blurb: blurb, image_url: image_url, tweets: tweets}
  end

  def self.data(current_user) 

  	current_user_tweet_data = current_user.tweets.map do |tweet|
  		hashtags = tweet.hashtags.map do |hashtag|
  			hashtag.text
  		end
  		{"content" => tweet.content, "hashtags" => hashtags}
  	end 
  	current_user = {"user_id" => current_user.id, "tweets" => current_user_tweet_data}

  	matches = User.all.map do |user|
  		user_tweet_data = user.tweets.map do |tweet|
  			hashtags = tweet.hashtags.map do |hashtag|
  				hashtag.text
  			end
  			{"content" => tweet.content, "hashtags" => hashtags}
  		end
  		{"user_id" => user.id, "tweets" => user_tweet_data}
  	end

  	{user: current_user, matches: matches}

  end

  def self.drunk_tye_matcher
  	data = User.all.map do |user|
  		{"user_id" => user.id, "twitter_percent" => rand(0.0..1.0)}
  	end
  	data = data.sort_by { |k| p k["twitter_percent"] }.reverse
	end

  def self.drunk_tye_processor(match_data)
  	match_data.map do |match|
  		user_id = match["user_id"]
  		twitter_percent = match["twitter_percent"]
 			user = User.find(user_id)
  		{"id" => user.id, "name" => user.name, "blurb" => user.blurb, "image_url" => user.image_url, "twitter_percent" => twitter_percent}
  	end
  end

end
