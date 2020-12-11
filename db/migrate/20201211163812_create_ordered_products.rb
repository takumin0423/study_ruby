class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
      t.belongs_to :order, null: false
      t.belongs_to :product, null: false
      t.integer :quantity, limit: 5
      t.date :expected_delivery_date
      t.timestamps
    end
  end
end
