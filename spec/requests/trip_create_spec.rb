require 'rails_helper'

RSpec.describe 'Trip creation', type: :request do
  subject { post '/api/trips', params: params, headers: headers }

  let(:headers) { { 'ACCEPT' => 'application/json' } }
  let(:params) { {} }

  let(:json_response) { JSON.parse(response.body) }

  it 'has a valid factory' do
    expect(FactoryBot.create(:trip)).to be_valid
  end

  context 'with valid data' do
    let(:params) { FactoryBot.attributes_for(:trip) }

    it 'returns 201 with json format' do
      subject
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'creates a trip' do
      expect { subject }.to change { Trip.count }.by(1)
    end

    it 'returns a trip' do
      subject
      expect(json_response).to include(
        'start_address' => 'Dietla  52, Kraków, Polska',
        'destination_address' => 'Jana Kantego Federowicza 57, Kraków, Polska',
        'price' => '5.0 PLN',
        'distance' => '3.78 km',
        'date' => '02-02-1999'
      )
    end
  end

  context 'with invalid data' do
    context 'with invalid address' do
      let(:params) do
        {
          start_address: 'Wewewewew',
          destination_address: 'Srururur',
          price: 3.54
        }
      end

      it 'returns 422 with json format' do
        subject
        expect(response).to have_http_status(422)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it 'does not create a trip' do
        expect { subject }.to_not change { Trip.count }
      end

      it 'returns error' do
        subject
        expect(json_response).to include(
          'messages' => 'Coordinates are missing'
        )
      end
    end
  end
end
