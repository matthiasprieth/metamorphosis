class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :password
      t.string :salt
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
