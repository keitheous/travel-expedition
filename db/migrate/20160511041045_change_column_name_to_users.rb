class ChangeColumnNameToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :default_currency, :country
  end
end
