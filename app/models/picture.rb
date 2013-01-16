class Picture < ActiveRecord::Base
	attr_accessible :description, :gallery, :name, :parent, :rating, :type, :user_id, :image
	has_many :comments
	belongs_to :user
	belongs_to :parent,
	    :class_name => Picture,
	    :foreign_key => :parent

	has_many :children,
	    :class_name => Picture,
	    :foreign_key => :parent

	# def has_parent
	#     if $challenge_picture_id
	#       @picture.parent = Picture.find($challenge_picture_id)
	#     end
	# end

	validates_presence_of :name
	#validates :name, :presence => true
	#from CarrierWave gem
	mount_uploader :image, ImageUploader
end
