class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

  # validates :email, presence: true
  mount_uploader :avatar, AvatarUploader

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      pass = Devise.friendly_token[0,20]
      user = user.new(name: auth.extra.raw_info.name,
                        provider: auth.provider,
                        uid: auth.uid,
                        email: auth.info.email,
                        password: pass,
                        password_confirmaiton: pass
                        )
      user.skip_confirmation!
      user.save
    end
    user
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
