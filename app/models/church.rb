class Church < ActiveRecord::Base
	# attr_accessible :name, :description, :city not needed in rails 4

	validates :name, presence: true
	
end
