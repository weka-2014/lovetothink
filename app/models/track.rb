class Track < ActiveRecord::Base
	# Validations? # Really you need to put in validations to make sure bad
	# data does not into your data base even if it is just the foreign key
	has_many :tags, dependent: :destroy
end
