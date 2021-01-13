class ApplicationController < ActionController::Base
  after_action :flush_logger

  def initialize
    @account = nil
  end

  private

  def flush_logger

  end

  def authenticate_user
    params.require([:token])
    if params["token"].present? && params["token"] == session[:token]
      @account = Account.find(session[:account_id])
      return true if @account.present?
    end
    raise 'Authentication Error'
  end

  def auth_user(controller_name)
    account = Account.where({ name: params[:name] }).last
    if params["password"].present? && account.password == params["password"]
      Encoding.default_internal = "UTF-8"
      token = Digest::MD5.hexdigest(controller_name)
      session[:token] = token.to_s
      session[:account_id] = account.id
      @account = account
    else
      raise 'Authentication Error'
    end
  end
end