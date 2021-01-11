module Deliveries
  class Packaging < Step
    def initialize(arg1 = nil)
      @name = "梱包"
    end

    def get_time_required
      1
    end
  end
end