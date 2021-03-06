require './lib/tokenator.rb'

class ApplicationController < ActionController::Base
  include Tokenator
  protect_from_forgery with: :null_session

  def current_user
    #token = params[:token] #token should be extracted from headers
    token = request.headers["Authorization"]
    if token.nil?
      head :unauthorized
    else
      payload = Tokenator.decode(token)
      @current_user ||= User.find_by_login(payload[0]['sub'])
    end
    @current_user
  end

  def logged_in?
    current_user != nil
  end

  def admin_user?
    current_user.role == "admin"
  end

  def authenticate_user!
    head :unauthorized unless logged_in?
  end

  def authorize_admin!
    head :unauthorized unless admin_user?
  end
end
