class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :account, null: false
      t.integer :delivery_method, limit: 3
      t.integer :payment_method, limit: 3
      t.integer :order_status, limit: 3
      t.timestamps

      t.index :delivery_method
      t.index :payment_method
      t.index :order_status
    end
  end
end
