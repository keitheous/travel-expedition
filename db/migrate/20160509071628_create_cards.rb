class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.text :image
      t.text :source

      t.timestamps null: false
    end
  end
end
