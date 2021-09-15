# == Schema Information
#
# Table name: trips
#
#  id                  :bigint           not null, primary key
#  date                :date
#  destination_address :string
#  distance            :decimal(, )
#  price_subunit       :integer
#  start_address       :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class TripSerializer
  include Callee

  option :trip

  def call
    ActiveSupport::JSON.encode(
      {
        distance: decorated_trip.distance_humanized,
        price: decorated_trip.price_humanized,
        start_address: trip.start_address,
        destination_address: trip.destination_address,
        date: decorated_trip.date_humanized
      }
    )
  end

  private

  def decorated_trip
    @decorated_trip ||= TripDecorator.decorate(trip)
  end
end
