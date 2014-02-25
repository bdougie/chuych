class Post < ActiveRecord::Base
	belongs_to :user 
	belongs_to :church

  validates :body, length: { maximum: 200 }, presence: true



end
