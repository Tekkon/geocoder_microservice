# frozen_string_literal: true

class GeocoderRoutes < Application
  namespace '/v1' do
    get '/geocode' do
      params = validate_with!(GeocoderParamsContract)
      data = Geocoder.geocode(params[:city])

      json data
    end
  end
end
