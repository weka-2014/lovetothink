class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #  :trackable, :rememberable, :recoverable,
  devise :database_authenticatable, :registerable, :validatable

  has_many :tweets

  def load_tweets

  	tweet_data = CLIENT.user_timeline(twitter_username)

  	tweet_data.each do |tweet_object|
  		tweet = tweets.create(content: tweet_object.text)
  		tweet_object.hashtags.each do |hashtag_object|
  			if hashtag_object.text
	  			tweet.hashtags.create(text: hashtag_object.text)
	  		end
  		end
  	end

  end

  def personal_info
  	{user_id: id, name: name, blurb: blurb, image_url: image_url, tweets: tweets}
  end

  def self.data 
  end

end
