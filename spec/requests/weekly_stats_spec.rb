require 'rails_helper'

RSpec.describe 'Weekly stats', type: :request do
  subject { get '/api/stats/weekly', params: params, headers: headers }

  let(:headers) { { 'ACCEPT' => 'application/json' } }
  let(:params) { {} }
  let(:time_zone_now) { '2021-09-15' }
  let(:json_response) { JSON.parse(response.body) }

  context 'with valid data' do
    let!(:trip_1) { create(:trip, date: time_zone_now, price: 5, distance: 10.0) }
    let!(:trip_2) { create(:trip, date: time_zone_now, price: 5, distance: 10.0) }
    let!(:trip_3) { create(:trip, date: time_zone_now, price: 5, distance: 10.0) }

    it 'returns 201 with json format' do
      subject
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns a trip' do
      subject
      expect(json_response).to include(
        "total_distance" => "30.0 km",
        "total_price" => "15 PLN",
      )
    end
  end

  context 'with trips' do
    context 'with invalid address' do
      it 'returns 422 with json format' do
        subject
        expect(response).to have_http_status(422)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'returns error' do
        subject
        expect(json_response).to include(
          'messages' => 'You have no trips in this week'
        )
      end
    end
  end
end
