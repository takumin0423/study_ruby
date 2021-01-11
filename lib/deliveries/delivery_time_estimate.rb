module Deliveries
  class DeliveryTimeEstimate
    attr_reader :processes
    @processes = Array.new

    def initialize(product, amount, postal_code)
      @processes = Array.new
      @product = product
      @amount = amount
      @postal_code = postal_code
    end

    def estimate_delivery_date_time
      self.define_delivery_process
      time_required = @processes.map(&:get_time_required)
      Time.zone.now.since((time_required.sum).days)
    end

    def define_delivery_process
      raise 'Undefined product error' if @product.nil?
      if (@product.stock.ec_stock_amount + @product.stock.store_stock_amount) < @amount
        @processes << Deliveries::FactoryOrder.new
      elsif @product.stock.ec_stock_amount > @amount
        @processes << Deliveries::EcStock.new
      else
        @processes << Deliveries::StoreStock.new
      end
      @processes << Deliveries::Delivery.new(@postal_code)
      @processes << Deliveries::Packaging.new
    end
  end
end