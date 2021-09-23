# frozen_string_literal: true

class GeocoderRoutes < Application
  namespace '/v1' do
    get do
      geocoder_params = validate_with!(GeocoderParamsContract)
      data = Geocoder::Service.call(geocoder_params)
      serializer = GeocoderSerializer.new(data)

      json serializer.serializable_hash
    end
  end
end
