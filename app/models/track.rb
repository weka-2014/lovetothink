class Track < ActiveRecord::Base
	has_many :tags, dependent: :destroy
end
