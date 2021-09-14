module Trips
  class DistanceCalculator
    include Callee
    include Dry::Monads[:result, :do]

    option :start_address
    option :destination_address

    def call
      start_coordinates = Geocoder.coordinates(start_address)
      destination_coordinates = Geocoder.coordinates(destination_address)

      if start_coordinates.blank? || destination_coordinates.blank?
        return Failure(messages: I18n.t('.trips.distance_calculator_error'))
      end

      distance ||= Geocoder::Calculations.distance_between(
        start_coordinates, destination_coordinates
      ).round(2)

      Success(distance)
    end
  end
end
