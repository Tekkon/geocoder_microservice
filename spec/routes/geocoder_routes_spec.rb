RSpec.describe GeocoderRoutes, type: :routes do
  describe 'GET /v1' do
    context 'valid params' do
      let(:city) { 'Москва' }

      context 'city is found' do
        let(:coords) { [51.2,52.5] }

        it 'returns coordinates' do
          allow(Geocoder).to receive(:geocode).with(city).and_return coords

          get '/v1', city: city

          expect(last_response.status).to eq 200
          expect(response_body).to eq coords
        end
      end

      context 'city is not found' do
        it 'returns nil' do
          allow(Geocoder).to receive(:geocode).with(city).and_return nil

          get '/v1', city: city

          expect(last_response.status).to eq 200
          expect(response_body).to eq nil
        end
      end
    end

    context 'invalid params' do
      it 'returns 422' do
        get '/v1'

        expect(last_response.status).to eq 422
      end
    end
  end
end
