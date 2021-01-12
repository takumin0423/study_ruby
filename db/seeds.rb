a1 = AccountFactory.create('system')
a1.attributes =	({
  name: "System User",
  password: "system"
})
a1.save

a2 = AccountFactory.create('admin')
a2.attributes =	({
  name: "Test Admin",
  password: "admin",
  email: "test@com",
  tel: "000999990000"
})
a2.save

a3 = AccountFactory.create('shopper')
a3.attributes =	({
  name: "Shop Admin",
  password: "shop",
  email: "test@com",
  tel: "000999990000"
})
a3.save

address_new = Address.create(
  account: a3,
  postal_code: "1000000",
  street: "Test Street",
  city: "Test City",
  state: "Test State",
  country: "TestCounty",
  )

# Create Operation For Logging Function
Operation.create({
                   sub_type:1,
                   name: "admin dashboard",
                 })

# Create Products and other related information
product = Product.create({
                           name: "テスト商品",
                           description: "テスト商品の説明",
                           ec_stock_id: 1,
                           store_stock_id: 3,
                           price: 1000
                         })

stock = Stock.create({
                       product_id: product.id,
                       ec_stock_amount: 3,
                       store_stock_amount: 1
                     })

product2 = Product.create({
                            name: "テスト商品2",
                            description: "テスト商品の説明2",
                            ec_stock_id: 1,
                            store_stock_id: 3,
                            price: 1200
                          })

stock2 = Stock.create({
                        product_id: product2.id,
                        ec_stock_amount: 3,
                        store_stock_amount: 1
                      })

# Execute after 9章
# UpdateStockInformationJob.new.perform