class ReportMail::Report

  def initialize(order_builder)
    @order_builder = order_builder.to_json
  end

  def output_report
    result = ""
    result += output_start
    result += output_head
    result += output_body_start
    result += output_body
    result += output_body_end
    result += output_end
  end

  def output_start
    raise 'Called abstract method' #<= この行を追加
  end

  def output_head
    raise 'Called abstract method' #<= この行を追加
  end

  def output_body_start
    raise 'Called abstract method' #<= この行を追加
  end

  def output_body
    raise 'Called abstract method' #<= この行を追加
  end

  def output_body_end
    raise 'Called abstract method' #<= この行を追加
  end

  def output_end
    raise 'Called abstract method' #<= この行を追加
  end
end