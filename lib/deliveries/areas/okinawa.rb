module Deliveries
  class Areas::Okinawa < Step
    def initialize
      @name = "沖縄への配送時間"
    end
    def get_time_required
      5
    end
  end
end