class ProfilesController < ApplicationController
  before_action :authenticate, only: [:update]
  before_action :set_profile, only: [:update, :show]
  
  def show
    render :json => @profile
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

end
