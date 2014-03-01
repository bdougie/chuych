class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # validates :email, presence: true
  mount_uploader :avatar, AvatarUploader

  before_create :set_member

  has_many :posts

  ROLES = %w[member moderator admin]
		def role?(base_role)
		  role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
		end  

	private

	def set_member
    self.role = 'member'
  end

end
