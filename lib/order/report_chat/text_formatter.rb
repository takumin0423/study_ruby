module ReportChat
  class Formatter
    def output(order_builder)
      raise 'This is abstract method'
    end
  end
  class TextFormatter < Formatter
    def output(order_builder)
      result = ""
      order_builder.to_json[:order][:products].each_with_index do | order, index |
        result += "#{index}: #{order&.dig(:name)} / #{order&.dig(:quantity)}個" + "\n"
      end
      result
    end
  end
end