class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :omniauthable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :provider, :uid, :profil_pic
  attr_accessible :description, :email, :firstname, :lastname, :password, :salt
  attr_accessible :oauth_token, :oauth_expires_at
  has_many :pictures
  has_many :comments
  #maybe implemented in the future
  #has_and_belongs_to_many :rewards
  validates_presence_of :username

  #from CarrierWave gem
  mount_uploader :profil_pic, ImageUploader

  default_scope -> { order('total_likes DESC') } #users with most likes at the top

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new(username:auth.extra.raw_info.name,
         provider:auth.provider,
         uid:auth.uid,
         email:auth.info.email,
         password:Devise.friendly_token[0,20],
         oauth_token:auth.credentials.token,
         oauth_expires_at:Time.at(auth.credentials.expires_at),
         username:auth.info.name
      )
      if auth.info.image.present?
        user.remote_profil_pic_url = auth.info.image
      end
    end
    user.skip_confirmation! #important you have to User.new and than save it, otherwise confirmationmail will be send
    user.save
    user
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  #just for testing
  def getLink
    facebook.get_object("me")
  end

  def likePicWall(like_id)
    picture=Picture.find(like_id)
    facebook.put_wall_post(
        "likes a picture on Metamorphosis",
        :name => picture.name+' on Metamorphosis',
        :link => 'http://metamorphosis.mediacube.at/pictures/'+like_id+'/',
        :caption => "Hey guys! Iv'e liked a picture on Metamorphosis!"
    )
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil
  end

  def createPicWall(picture)
    facebook.put_wall_post(
        "created a picture on Metamorphosis",
        :name => picture.name+'on Metamorphosis',
        :link => "http://metamorphosis.mediacube.at/pictures/"+picture.id.to_s+"/",
        :caption => "Hey guys! Iv'e created a picture on Metamorphosis!"
    )
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil
  end
  def nice_username
    self.username.split(' ').map {|w| w.capitalize }.join(' ')
  end  
end
