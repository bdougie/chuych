class Church < ActiveRecord::Base
	# attr_accessible :name, :description, :city, :tag_list no longer acceptable in rails 4
	acts_as_taggable

	validates :name, :city, presence: true
	validates :description, length: { minimum: 10 }

	
end
