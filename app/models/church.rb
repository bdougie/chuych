class Church < ActiveRecord::Base
	acts_as_taggable
	acts_as_taggable_on :denominations, :tags

	validates :name, presence: true
  validates :city, presence: true
	validates :description, length: { minimum: 10 }

	has_many :favorites, dependent: :destroy

	geocoded_by :city
	after_validation :geocode
	# I commented out due to error, if => :city_changed?

	#searchable method is undefined
	# searchable do
	# 	text :city, :latitude, :longitude
	# end

end
