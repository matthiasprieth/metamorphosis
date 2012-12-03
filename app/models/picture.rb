class Picture < ActiveRecord::Base
  attr_accessible :description, :gallery, :name, :parent, :rating, :type, :user_id
  has_many :comments
  belongs_to :user
end
