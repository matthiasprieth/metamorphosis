class AddProfilPicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profil_pic, :string
  end
end
