class TestController < ApplicationController
  before_action :only_development

  def index
    logger1 = AnyLogger.instance
    logger2 = AnyLogger.instance
    logger2.add_logs(title: 'test', description: 'This is test for flush logs 1', account: Account.system_user, operation: Operation.dashboard)

    render json: { logger1: logger1.object_id, logger2: logger2.object_id }, status: 200
  end

  def get_stock_list
    default_client = StockClient.new
    store_amount = default_client.get_stock(1)
    # render json: {store_amount: store_amount}, status: 200

    # ↓ここから追加
    default_client = StockClient.new(EcStockAdapter.new(ECStockClient.new))
    ec_amount = default_client.get_stock(3)
    render json: {store_amount: store_amount, ec_amount: ec_amount}, status: 200
  end

  def create_order
    render json: {}, status: 200
  end

  def order_builder
    @order = Order.eager_load(:products, account: [:addresses, :account_rank]).all.last
    order_builder = OrderBuilder.new(@order)
    order_builder.set_mask.visible_account.visible_address.visible_order_details
    render json: {order: order_builder.to_json}, status: 200
  end

  def order_builder_collection
    @orders = Order.eager_load(:products, account: [:addresses, :account_rank]).limit(3)
    order_builder_collection = OrderBuilderCollection.new(@orders)
    order_builder_collection.set_mask
    order_builder_collection.visible_account
    collection_result = [].tap do | result |
      order_builder_collection.each do | order_builder |
        result << order_builder.to_json
      end
    end
    render json: {order: collection_result}, status: 200
  end

  def order_query
    shopper = Account.where(account_type: Account.account_types[:shopper]).last
    product = Product.all.last
    query = OrderQuery::WithAccount.new.by_account(shopper)
    query = OrderQuery::WithProduct.new(query.relation).by_product(product).order_by(:name)
    query = query.relation.limit(3)
    render json: {query: query}, status: 200
  end

  def send_mail_plain
    # 注文情報を1件取得
    shopper = Account.where(account_type: Account.account_types[:shopper]).last
    query = OrderQuery::WithAccount.new.by_account(shopper)
    @order = query.relation.last

    # OrderBuilderの生成
    order_builder = OrderBuilder.new(@order)
    order_builder.set_mask.visible_account.visible_address.visible_order_details

    # メール本文の生成
    text_report = ReportMail::TextReport.new(order_builder)

    render plain: text_report.output_report, status: 200
  end

  def send_mail_html
    render json: {}, status: 200
  end

  def formatter_plain
    render json: {}, status: 200
  end

  private

  def only_development
    raise StandardError unless Rails.env == 'development'
  end
end
