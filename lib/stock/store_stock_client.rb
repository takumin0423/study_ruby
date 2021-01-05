class StoreStockClient
  attr_reader :name

  def initialize
    @url = 'http://test.jp/'
    @name = 'Store Stock'
  end

  def get_stock_from_store_api(id)
    uri = URI.parse(@url)
    { id: id, amount: 3 }
  end
end