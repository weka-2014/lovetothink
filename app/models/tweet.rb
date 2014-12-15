class Tweet < ActiveRecord::Base
	has_many :hashtags, dependent: :destroy

end
