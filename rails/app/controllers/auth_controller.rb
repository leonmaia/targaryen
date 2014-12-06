class AuthController < ApplicationController
  before_action :authenticate, except: [:login]

  def login
    @user = User.find_by_email(params[:email].downcase)

    if @user && @user.authenticate(params[:password])
      render json: @user, methods: [:access_token]
    else
      render_unauthorized
    end
  end

  def logout
    @token.deactivate
    render json: {}
  end
  
  def user_params
    params.permit(:email, :password)
  end
end
