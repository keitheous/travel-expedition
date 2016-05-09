class CreateCardTags < ActiveRecord::Migration
  def change
    create_table :card_tags do |t|
      t.integer :card_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
