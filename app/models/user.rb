class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook] # removed ':twitter' until I can find a workaround for email.

  validates :email, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :favorites, dependent: :destroy
  has_many :posts

  mount_uploader :avatar, AvatarUploader

  before_create :set_member

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

  def favorited(church)
    self.favorites.where(church_id: church.id).first
  end

  ROLES = %w[member moderator admin]
		def role?(base_role)
		  role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
		end

private
	def set_member
    self.role = 'member'
  end

  # TODO: Code to set default avatar
  #
  # def set_avatar
  #   self.avatar = image_tag()
  # end

end
