require './lib/tokenator.rb'

class AuthenticationController < ApplicationController
  include Tokenator

  def create
    # authenticator = Authenticator.new
    # user_info = authenticator.github(params[:code])
    #
    # login = user_info[:login]
    # name = user_info[:name]
    # avatar_url = user_info[:avatar_url]
    #
    # token = Tokenator.encode(login)
    # User.where(login: login).first_or_create!(
    #   name: name,
    #   avatar_url: avatar_url
    # )
    # redirect_to "#{issuer}?token=#{token}"
    # rescue StandardError => error
    # redirect_to "#{issuer}?error=#{error.message}"
  end

  private

  def issuer
    ENV['MENTOR_MATCH_CLIENT_URL']
  end
end
