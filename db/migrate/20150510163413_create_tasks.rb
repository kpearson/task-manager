class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :list, index: true, foreign_key: true
      t.boolean :complete, default: false
      t.text :description

      t.timestamps null: false
    end
  end
end
