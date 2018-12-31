class Authenticator
  def initialize(connection = Faraday.new)
    @connection = connection
  end

  def github(code)
    access_token_response = fetch_github_access_token(code)
    access_token = access_token_response['access_token']
    user_info_response = fetch_github_user_info(access_token)

    {
      issuer: ENV['MENTOR_MATCH_CLIENT_URL'],
      login: user_info_response['login'],
      name: user_info_response['name'],
      avatar_url: user_info_response['avatar_url']
    }
  end

  private

  def fetch_github_access_token(code)
    response = @connection.post ENV['GITHUB_ACCESS_TOKEN_URL'], {
      code:          code,
      client_id:     ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET']
    }
    raise IOError, 'FETCH_ACCESS_TOKEN' unless response.success?''
    URI.decode_www_form(response.body).to_h
  end

  def fetch_github_user_info(access_token)
    response = @connection.get ENV['GITHUB_USER_INFO_URL'], {
      access_token: access_token
    }
    raise IOError, 'FETCH_USER_INFO' unless response.success?
    JSON.parse(response.body)
  end
end
