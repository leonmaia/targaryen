class UsersController < ApplicationController
  before_action :authenticate, except: [:create, :index]

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user.to_json(:methods => [:auth_token])
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def user_params
    params.permit(:email, :password, :username)
  end

  def index
    @users = User.all
    render json: @users
  end
end
