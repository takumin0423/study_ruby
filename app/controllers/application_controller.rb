class ApplicationController < ActionController::Base
  after_action :flush_logger

  def initialize
    @account = nil
  end

  def flush_logger
    AnyLogger.instance.flush_logs
  end
end