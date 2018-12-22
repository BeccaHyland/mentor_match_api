class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include Knock::Authenticable

  protected

  def authorize_as_admin
    return_unauthorized unless !current_user.nil? && current_user.is_admin?
  end
end
