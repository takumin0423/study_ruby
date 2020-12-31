require 'singleton'

class AnyLogger
  include Singleton

  def initialize
    @commands = []
    @logs = []
  end

  def add_operation(command, decorator)
    @commands << { cmd: command, decorator: decorator }
  end

  def add_logs(title:, description:, account:, operation:)
    @logs << { title: title, description: description, account: account, operation: operation }
  end

  def flush_logs
    binding.pry
  end
end