class JourneysController < ApplicationController
  before_action :authenticate, except: [:index, :list]

  def index
    if params.has_key?(:user_id)
      @journeys = Journey.where(user_id: params[:user_id])
      render json: @journeys, include: :locations
    else
      @journeys = Journey.all
      render json: @journeys, include: :locations
    end
  end

  def list
    @journeys = Journey.all
    render json: @journeys, include: :locations
  end

  def update
    @journey = Journey.find(params[:id])
    
    if @journey.update(journey_params)
      render json: @journey
    else
      render json: @journey.errors, status: :unprocessable_entity
    end
  end

  def create
    @journey = Journey.new(journey_params)

    if @journey.save
      render json: @journey
    else
      render json: @journey.errors, status: :unprocessable_entity
    end
  end

  def journey_params
    params.require(:journey).permit(:user_id, :title)
  end

end
