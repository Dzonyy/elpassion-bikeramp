require 'rails_helper'

RSpec.describe TripSerializer do
  describe '.call' do
    subject { described_class.call(trip: trip) }
    let!(:trip) { create(:trip, date: time_zone_now, price: 5, distance: 10.0) }
    let(:time_zone_now) { Time.zone.now }

    let!(:expected_json) do
      "{\"distance\":\"10.0 km\",\"price\":\"5.0 PLN\",\"start_address\":\"Dietla  52, Kraków, Polska\",\"destination_address\":\"Jana Kantego Federowicza 57, Kraków, Polska\",\"date\":\"15-09-2021\"}"
    end

    it { expect(subject).to eq(expected_json) }
  end
end
