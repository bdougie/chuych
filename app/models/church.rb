class Church < ActiveRecord::Base
	# attr_accessible :name, :description, :city no longer acceptable in rails 4

	validates :name, :city, presence: true
	validates :description, length: { minimum: 10 }

	
end
