class ApplicationController < ActionController::Base
  include Authentication

  protect_from_forgery with: :null_session

  def user_not_authorized
    head :forbidden
  end
end
