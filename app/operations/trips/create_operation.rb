module Trips
  class CreateOperation < ApplicationOperation
    option :params

    def call
      yield calculate_distance

      create_trip
    end

    private

    def create_trip
      trip = Trip.create(params.merge(distance: calculate_distance.success))

      if trip.save
        Success(trip)
      else
        Failure(trip.errors)
      end
    end

    def calculate_distance
      @calculate_distance ||= Trips::DistanceCalculator.call(
        start_address: params[:start_address],
        destination_address: params[:destination_address]
      )
    end
  end
end
