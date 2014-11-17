class UsersController < ApplicationController
  before_action :authenticate, except: [:create, :show]

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

  def show
    if User.exists?(username: params[:username])
      @user = User.find_by(username: params[:username])
      render json: @user, include: :profile
    else
      render json: { message: "User not found" }.to_json, status: 404
    end
  end

end
