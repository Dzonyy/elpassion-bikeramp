require 'rails_helper'

RSpec.describe 'Monthly stats', type: :request do
  subject { get '/api/stats/monthly', params: params, headers: headers }

  let(:headers) { { 'ACCEPT' => 'application/json' } }
  let(:params) { {} }
  let(:time_zone_now) { Time.zone.now }
  let(:json_response) { JSON.parse(response.body) }

  context 'with valid data' do
    let!(:trip_1) { create(:trip, date: time_zone_now, price: 5, distance: 10.0) }
    let!(:trip_2) { create(:trip, date: time_zone_now, price: 5, distance: 10.0) }
    let!(:trip_3) { create(:trip, date: time_zone_now, price: 5, distance: 10.0) }
    let!(:trip_4) { create(:trip, date: time_zone_now - 1.day, price: 7, distance: 13.0) }
    let!(:trip_5) { create(:trip, date: time_zone_now - 1.day, price: 7, distance: 13.0) }
    let!(:trip_6) { create(:trip, date: time_zone_now - 1.day, price: 5, distance: 10.0) }

    it 'returns 201 with json format' do
      subject
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns ' do
      subject
      expect(json_response).to include(
        {
          'avg_price' => '6.33 PLN',
          'avg_ride' => '12.0 km',
          'date' => '2021-09-14',
          'total_distance' => '36.0 km'
        },
        {
          'avg_price' => '5.0 PLN',
          'avg_ride' => '10.0 km',
          'date' => '2021-09-15',
          'total_distance' => '30.0 km'
        }
      )
    end
  end

  context 'with trips' do
    context 'with invalid address' do
      it 'returns 422 with json format' do
        subject
        expect(response).to have_http_status(401)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'returns error' do
        subject
        expect(json_response).to include(
          'messages' => 'You have no trips in this month'
        )
      end
    end
  end
end
