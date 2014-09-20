class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
