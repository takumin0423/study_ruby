class CreateOrderBills < ActiveRecord::Migration[5.2]
  def change
    create_table :order_bills do |t|
      t.belongs_to :order, null: false
      t.integer :total_price
      t.integer :discount_price
      t.integer :shipping_fee
      t.integer :billing_amount
      t.timestamps
    end
  end
end
