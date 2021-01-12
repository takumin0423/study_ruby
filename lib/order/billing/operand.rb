module Order::Billing
  class Operand
    def initialize
      raise 'Abstract Class !!'
    end
    def get_operand_price
      raise 'Abstract Method !!'
    end
  end
end