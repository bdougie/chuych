class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter]

  # these validations are throwing errors
  # validates :email, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true

  mount_uploader :avatar, AvatarUploader

  # def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  #   user = User.where(:provider => auth.provider, :uid => auth.uid).first
  #   unless user
  #     pass = Devise.friendly_token[0,20]
  #     user = User.new(name: auth.extra.raw_info.name,
  #                       provider: auth.provider,
  #                       uid: auth.uid,
  #                       email: auth.info.email,
  #                       # avatar: auth.image,
  #                       password: pass,
  #                       password_confirmation: pass
  #                       )
  #     user.skip_confirmation!
  #     user.save
  #   end
  #   user
  # end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.email = auth.info.email
      user.remote_avatar_url = auth.info.image
      user.skip_confirmation!
    end

  end

  def email_required?
    super && provider.blank?
  end 

  def password_required?
    super && provider.blank?
  end 

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
