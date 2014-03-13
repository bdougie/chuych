class Post < ActiveRecord::Base
	belongs_to :user 
	belongs_to :church

	has_many :votes, dependent: :destroy

  validates :body, length: { maximum: 200 }, presence: true

 	default_scope ->{order('created_at DESC')}


   def up_votes
      self.votes.where(value: 1).count
   end

   def down_votes
      self.votes.where(value: -1).count
   end

   def points
      self.votes.sum(:value).to_i     
   end 

   def update_rank
      # age = (self.created_at - Time.new(1970,1,1)) / 86400
      new_rank = points 

      self.update_attribute(:rank, new_rank)
   end

   private

   # Possible alternative: after_create, create a +1 vote for the User the Bookmark belongs to
   # (forcing rank update)
   def set_initial_rank
      self.rank = 0
   end

   def create_vote
      self.user.votes.create(value: 1, post: self)
   end



end
