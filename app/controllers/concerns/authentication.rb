module Authentication
  extend ActiveSuport::Concern

  def current_user
    @current_user ||= @token.user
  end

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @token = ApiToken.where(access_token: token, active: true).first
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    head :unauthorized
  end

end
