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
    @local_logs = @logs.dup
    @logs = Array.new
    @commands.each do |commands|
      decorator = commands[:decorator].new(Decorators::SimpleFormatter.new(commands[:cmd].new))
      @local_logs.each do |log|
        decorator.format_line(log)
      end
      decorator.execute #<= この行を追加
    end
  rescue => e
    raise StandardError
  end
end