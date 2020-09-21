class FlightPassengersController < ApplicationController
  def destroy
    passenger = Passenger.find(params[:passenger_id])
    passenger.flights.destroy(params[:flight_id])
    redirect_to request.referrer
  end
end
