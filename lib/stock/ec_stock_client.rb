class ECStockClient
  attr_reader :name
  def initialize
    @url = 'http://test.jp/'
    @name = "EC Stock"
  end

  def get_stock_from_api(id)
    uri = URI.parse(@url)
    {id: id, amount: 12}
  end
end