class OrderBuilderCollection
  include Enumerable

  def initialize(order)
    @orders = order
    @mask = false
    @account = false
  end

  def set_mask
    @mask = true
  end

  def visible_account
    @account = true
  end

  def each
    @orders.each do | order |
      order_builder = OrderBuilder.new(order)
      order_builder.set_mask if @mask
      order_builder.visible_account if @account
      yield order_builder
    end
  end

end