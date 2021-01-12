module Order::Billing
  class Operator
    def execute
      raise 'Abstract Method !!'
    end
  end
end