class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  respond_to :json

  def user_not_authorized
    head :forbidden
  end
end
