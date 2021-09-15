# frozen_string_literal: true

require 'rails_helper'

describe Stats::CalculateWeekly do
  include Dry::Monads[:result]

  subject { calculate_operation.call }

  describe '#call' do
    context 'when succeed' do
      let(:calculate_operation) { instance_double(described_class) }
      let!(:trips_list) { create_list(:trip, 3, date: Time.zone.now, price: 10.0, distance: 10.0) }
      let(:stats) { instance_double(Stats::Weekly) }

      let(:expected_monad) do
        Success(stats)
      end

      it do
        allow(calculate_operation).to receive(:call).and_return(expected_monad)
        expect(subject).to eql(expected_monad)
      end
    end

    context 'when failed' do
      let(:calculate_operation) { described_class.new }

      context 'without any trips in period' do
        let(:expected_monad) do
          Failure(messages: 'You have no trips in this week')
        end

        it { expect(subject).to eql(expected_monad) }
      end
    end
  end
end
