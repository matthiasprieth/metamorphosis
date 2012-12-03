class User < ActiveRecord::Base
  attr_accessible :description, :email, :firstname, :lastname, :password, :salt
  has_many :pictures
  has_many :comments
  has_and_belongs_to_many :rewards
end
