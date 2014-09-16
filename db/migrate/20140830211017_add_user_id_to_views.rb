class AddUserIdToViews < ActiveRecord::Migration
  def change
    add_column :views, :user_id, :integer
    add_index :views, :user_id
  end
end

