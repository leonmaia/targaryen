class JourneysController < ApplicationController
  def index
    @journeys = Journey.all
    render json: @journeys
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
    params.require(:journey).permit(:user_id)
  end
end
