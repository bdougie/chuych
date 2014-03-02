class Church < ActiveRecord::Base
	# attr_accessible :name, :description, :city, :tag_list no longer acceptable in rails 4
	acts_as_taggable

	geocoded_by :city
	# after_validation :geocode, if => :city_changed?

	validates :name, :city, presence: true
	validates :description, length: { minimum: 10 }

	
end
