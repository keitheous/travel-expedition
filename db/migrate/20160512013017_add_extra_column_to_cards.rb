class AddExtraColumnToCards < ActiveRecord::Migration
  def change
    add_column :cards, :complete, :boolean
  end
end
