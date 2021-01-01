class Decorators::TextDecorator < Decorator
  def initialize(real_formatter)
    super
    @pos = 1
  end
  def format_line(row)
    @real_formatter.format_line("#{Time.zone.now},#{@pos},#{row[:title]},#{row[:description]},#{row[:account].id},#{row[:operation].name}")
    @pos += 1
  end
end