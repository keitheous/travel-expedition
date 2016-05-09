class CreateCountryCards < ActiveRecord::Migration
  def change
    create_table :country_cards do |t|
      t.integer :card_id
      t.integer :country_id

      t.timestamps null: false
    end
  end
end
