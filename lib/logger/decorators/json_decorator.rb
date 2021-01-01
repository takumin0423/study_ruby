class Decorators::JsonDecorator < Decorator
  def format_line(row)
    @real_formatter.format_line(
      {
        title: row[:title],
        description: row[:description],
        account: row[:account].id,
        operation: row[:operation].name
      }.to_json)
  end
end