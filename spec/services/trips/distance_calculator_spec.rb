require 'rails_helper'

describe Trips::DistanceCalculator do
  include Dry::Monads[:result]

  subject do
    described_class.call(
      start_address: start_address,
      destination_address: destination_address
    )
  end

  context 'with valid params' do
    let(:start_address) { 'Dietla  52, Kraków, Polska' }
    let(:destination_address) { 'Jana Kantego Federowicza 57, Kraków, Polska' }

    it 'returns distance from geocoder' do
      expect(subject).to eq(Success(3.78))
    end
  end

  context 'with invalid params' do
    let(:start_address) { 'AAAAAA' }
    let(:destination_address) { 'qrrrrrr' }

    it 'it expect an error with message' do
      expect(subject).to eq(Failure({:messages=>"Coordinates are missing"}))
    end
  end
end
