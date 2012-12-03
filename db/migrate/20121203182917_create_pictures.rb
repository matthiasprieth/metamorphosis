class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.text :description
      t.string :type
      t.integer :parent
      t.string :gallery
      t.float :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
