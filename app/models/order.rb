class Order < ApplicationRecord
  has_many :ordered_products
  has_many :products, through: :ordered_products
  belongs_to :account
  has_one :order_bill

  enum delivery_method: {
    express: 0,
    limit: 1
  }

  enum payment_method: {
    cash: 0,
    credit_card: 1
  }

  enum order_status: {
    created: 0,
    confirmed: 1,
    payment_process: 2,
    shopping_process: 3,
    refund: 4
  }
end
