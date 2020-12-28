class TestController < ApplicationController
  before_action :only_development

  def index
    render json: {}, status: 200
  end

  def get_stock_list
    render json: {}, status: 200
  end

  def create_order
    render json: {}, status: 200
  end

  def order_builder
    render json: {}, status: 200
  end

  def order_builder_collection
    render json: {}, status: 200
  end

  def order_query
    render json: {}, status: 200
  end

  def send_mail_plain
    render json: {}, status: 200
  end

  def send_mail_html
    render json: {}, status: 200
  end

  def formatter_plain
    render json: {}, status: 200
  end

  private

  def only_development
    raise StandardError unless Rails.env == 'development'
  end
end
