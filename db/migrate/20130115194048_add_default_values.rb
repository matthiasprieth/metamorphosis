class AddDefaultValues < ActiveRecord::Migration
  def up
  	change_column   :users, :profil_pic, :string, :default => "default_profil_pic.jpg" 
	change_column  :users, :total_likes, :integer, :default => 0
	change_column  :pictures, :pic_likes, :integer, :default => 0

	add_index :comments, :picture_id
	add_index :pictures, :user_id
	add_index :rewards, :user_id
	add_index :rewards, :rewards_id
  end

  def down
  	
  end
end
