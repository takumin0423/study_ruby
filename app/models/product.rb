class Product < ApplicationRecord
  has_one :stock
  has_many :ordered_products
  has_many :orders, through: :ordered_products
end
