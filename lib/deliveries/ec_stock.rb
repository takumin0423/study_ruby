module Deliveries
  class EcStock < Step
    def initialize(arg1 = nil)
      @name = "EC在庫取得時間"
    end

    def get_time_required
      1
    end
  end
end