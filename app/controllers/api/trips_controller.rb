module Api
  class TripsController < ApplicationController
    def create
      result = Trips::CreateOperation.call(params: trip_params)

      case result
      when Success
        render json: ::TripSerializer.call(trip: result.success), status: 201
      when Failure
        render json: result.failure
      end
    end

    private

    def trip_params
      params.permit(:price_subunit, :date, :start_address, :destination_address)
    end
  end
end
