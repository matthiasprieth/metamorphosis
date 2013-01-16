class AddDefaultValues < ActiveRecord::Migration
  def up
  	change_column   :users, :profil_pic, :string, :default => "default_profil_pic.jpg" 
	change_column  :users, :total_likes, :integer, :default => 0
	change_column  :pictures, :pic_likes, :integer, :default => 0
  end

  def down
  	
  end
end
