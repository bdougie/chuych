class Church < ActiveRecord::Base
	# attr_accessible :name, :description, :city, :tag_list no longer acceptable in rails 4
	acts_as_taggable
	acts_as_taggable_on :denominations, :tags

	geocoded_by :city
	after_validation :geocode
	# I commented out due to error, if => :city_changed?

	#searchable method is undefined
	# searchable do
	# 	text :city, :latitude, :longitude
	# end

	validates :name, :city, presence: true
	validates :description, length: { minimum: 10 }

	
end
