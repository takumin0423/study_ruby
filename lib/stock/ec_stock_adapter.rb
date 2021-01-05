class EcStockAdapter < StoreStockClient
  def initialize(ecs)
    @ecs = ecs
  end

  def name
    @ecs.name
  end

  def get_stock_from_store_api(id)
    @ecs.get_stock_from_api(id)
  end
end