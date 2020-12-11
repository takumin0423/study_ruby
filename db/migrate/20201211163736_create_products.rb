class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.binary :picture
      t.integer :ec_stock_id, null: false
      t.integer :store_stock_id, null: false
      t.integer :price
      t.timestamps

      t.index :ec_stock_id
      t.index :store_stock_id
    end
  end
end
