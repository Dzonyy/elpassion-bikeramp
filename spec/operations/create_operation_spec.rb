# frozen_string_literal: true

require 'rails_helper'

describe Trips::CreateOperation do
  include Dry::Monads[:result]

  subject { create_operation.call }

  describe '#call' do
    before do
      allow(Trips::DistanceCalculator).to receive(:call).and_return(Success(20))
    end
    context 'when operation succeed' do
      let(:create_operation) { instance_double(described_class) }
      let(:trip) { instance_double(Trip) }
      let(:params) do
        {
          start_address: 'Jana Kantego Federowicza 7, Warszawa, Polska',
          destination_address: 'Dietla 52, Kraków, Polska',
          price: 22.00,
          date: '28-01-2021'
        }
      end

      let(:expected_monad) do
        Success(trip)
      end

      it do
        allow(create_operation).to receive(:call).and_return(Success(trip))
        expect(subject).to eql(expected_monad)
      end
    end

    context 'when operation failed' do
      let(:create_operation) { described_class.new(params: params) }

      context 'without price and date' do
        let(:params) do
          {
            start_address: 'Jana Kantego Federowicza 7, Warszawa, Polska',
            destination_address: 'Dietla 52, Kraków, Polska'
          }
        end

        let(:expected_monad) do
          Failure(
            {
              date: ["can't be blank"],
              price: ["can't be blank", 'is not a number', 'is not a number'],
              price_subunit: ['is not a number'] }
          )
        end

        it { expect(subject).to eq(expected_monad) }
      end
    end
  end
end
