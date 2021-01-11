module Deliveries
  class Delivery < Step
    def initialize(postal_code)
    @postal_code = postal_code
    @name = "配送時間"
    end
    def get_time_required
      # ↓ ここから追加
      if @postal_code == "1000000"
        Areas::Kanto.new.get_time_required
      elsif @postal_code == "9000000"
        Areas::Okinawa.new.get_time_required
      else
        3
      end
      # ↑ここまで追加
    end
  end
end