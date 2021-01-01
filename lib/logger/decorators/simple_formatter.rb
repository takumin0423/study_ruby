class Decorators::SimpleFormatter
  attr_reader :account
  def initialize(command)
    @command = command
    @result = []
  end
  def format_line(row)
    @result << row
  end
  def execute
    @command.execute(@result)
  end
end