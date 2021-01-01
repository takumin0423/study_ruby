require 'forwardable'

class Decorator
  extend Forwardable

  delegate [:format_line, :pos, :execute] => :@real_formatter
  def initialize(real_formatter)
    @real_formatter = real_formatter
    @result = []
  end
end