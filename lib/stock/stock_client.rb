class StockClient
  def initialize(store_stock = nil)
    store_stock ||= StoreStockClient.new

    @store_stock = store_stock
    @local_logger = AnyLogger.instance
  end

  def add_operation_log
    @local_logger.add_logs('Stock API Log', "Call #{@store_stock.name}", Account.system_user, Operation.dashboard)
  end

  def get_stock(id)
    add_operation_log
    @store_stock.get_stock_from_store_api(id)
  end
end