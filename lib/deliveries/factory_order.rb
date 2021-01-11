module Deliveries
  class FactoryOrder < Step
    def initialize(arg = nil)
      @name = "工場注文"
    end

    def get_time_required
      1
    end
  end
end