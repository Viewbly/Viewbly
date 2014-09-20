class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :password_digest
      t.string :username

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :username
    add_index :users, :full_name
  end
end
