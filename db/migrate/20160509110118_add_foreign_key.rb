class AddForeignKey < ActiveRecord::Migration
  def change
    add_foreign_key :cards, :users
    add_foreign_key :country_cards, :cards
    add_foreign_key :country_cards, :countries
    add_foreign_key :card_tags, :cards
    add_foreign_key :card_tags, :tags
  end
end
