class Api::V1::DestinationsController < ApplicationController
  def show
    destination = Destination.find(params[:id])
    render json: DestinationSerializer.new(destination)
  end
end
