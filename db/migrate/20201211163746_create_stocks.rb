class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.belongs_to :product
      t.integer :ec_stock_amount, limit: 5
      t.integer :store_stock_amount, limit: 5
      t.timestamps
    end
  end
end
