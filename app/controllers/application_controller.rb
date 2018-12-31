require './lib/tokenator.rb'

class ApplicationController < ActionController::Base
  include Tokenator

  protect_from_forgery with: :null_session

  def current_user
    token = params[:token]
    payload = Tokenator.decode(token)
    @current_user ||= User.find_by_login(payload[0]['sub'])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user!
    head :unauthorized unless logged_in?
  end

end
