class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticated?

  protected

  def authenticated?
    redirect_to login_url unless session[:persisted]
  end

  def authenticate(username, password)
    username == ENV['APP_USERNAME'] && password == ENV['APP_PASSWORD']
  end

  def sign_in
    session[:persisted] = true
  end

  def sign_out
    session[:persisted] = nil
  end
end
