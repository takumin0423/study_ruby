module Order::Billing
  module Currency
    YEN = 1
    DOLL = 2
    EURO = 3
  end

  class Price < Operand
    def initialize(price)
      @operand_price = price
      @bill_type = Order::Billing::Currency::YEN
    end
    def get_operand_price
      return @operand_price if @bill_type == Currency::YEN
      raise 'Other currency types are not implemented!'
    end
  end
end