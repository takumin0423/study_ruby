Rails.application.routes.draw do
  get 'test/index'
  get 'test/get_stock_list'
  get 'test/get_delivery_date'
  get 'test/create_order'
  get 'test/order_builder'
  get 'test/order_builder_collection'
  get 'test/order_query'
  get 'test/send_mail_plain'
  get 'test/send_mail_html'
  get 'test/formatter_plain'
  get 'test/formatter_html'
end
