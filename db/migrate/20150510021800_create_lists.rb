class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.boolean :archived, default: false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end