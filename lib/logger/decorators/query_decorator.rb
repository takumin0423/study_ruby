class Decorators::QueryDecorator < Decorator
  def format_line(row)
    current_time = Time.zone.now
    @real_formatter.format_line(
      "('" + "#{row[:title]}: #{row[:description]}" + "', #{row[:account].id}, #{row[:operation].id}, '#{current_time}', '#{current_time}')"
    )
  end
end