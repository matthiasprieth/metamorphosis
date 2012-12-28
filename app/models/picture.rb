class Picture < ActiveRecord::Base
  attr_accessible :description, :gallery, :name, :parent, :rating, :type, :user_id, :image
  has_many :comments
  belongs_to :user
  #validates :name, :presence => true

  #from CarrierWave gem
  mount_uploader :image, ImageUploader

  #acts_as_commentable gem
  acts_as_commentable
end
