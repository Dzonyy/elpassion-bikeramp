module Trips
  class CreateOperation < ApplicationOperation
    option :params

    def call
      distance = yield calculate_distance

      create_trip(distance: distance)
    end

    private

    def create_trip(distance:)
      trip = Trip.new(params.merge(distance: distance))

      if trip.save
        Success(trip)
      else
        Failure(trip.errors.messages)
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
