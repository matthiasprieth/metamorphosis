class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :omniauthable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :provider, :uid
  attr_accessible :description, :email, :firstname, :lastname, :password, :salt
  attr_accessible :oauth_token, :oauth_expires_at
  has_many :pictures
  has_many :comments
  has_and_belongs_to_many :rewards
  validates_presence_of :username

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(username:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20],
                         oauth_token:auth.credentials.token,
                         oauth_expires_at:Time.at(auth.credentials.expires_at)
      )
    end
    user.skip_confirmation!
    user
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def getLink
    facebook.get_object("me")
  end

end