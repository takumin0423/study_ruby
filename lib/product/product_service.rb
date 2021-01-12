class ProductService
  def initialize(account)
    @logger = AnyLogger.instance
    @operation = Operation.dashboard
    @account = account
  end

  def create_or_update(params)
    @product = Product.find_or_initialize_by(id: params[:id])
    @product.attributes = {
      name: params[:name],
      description: params[:description],
      ec_stock_id: params[:ec_stock_id],
      store_stock_id: params[:store_stock_id]
    }
    @product.save!
    @logger.add_logs('Product Operation', 'Add/Update product infomation', @account, @operation)
    @product
  end

  def update_stock
    Product.all.each do |product|
      default_client = StockClientProxy.new(@account)
      store_amount = default_client.get_stock(product.store_stock_id)
      default_client = StockClientProxy.new(@account, EcStockAdapter.new(ECStockClient.new))
      ec_amount = default_client.get_stock(product.ec_stock_id)
      stock = product.stock || product.build_stock
      stock.attributes = {
        ec_stock_amount: ec_amount[:amount],
        store_stock_amount: store_amount[:amount]
      }
      stock.save!
    end

    def list_all(pos = 0, limit = 10)
      Product.with_stock.all.limit(limit).offset(pos)
    end
  end
end