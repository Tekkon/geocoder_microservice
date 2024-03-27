# frozen_string_literal: true

require_relative './grpc_server/geocoder_services_pb.rb'

class GeocoderService < Geocoder::GeocoderService::Service
  DATA_PATH = Application.root.concat('/db/data/city.csv')

  def geocode(_request, _call)
    Geocoder::Coordinates.new(
      lat: data[_request.name].first,
      lon: data[_request.name].last,
    )
  end

  def data
    @data ||= load_data!
  end

  private

  def load_data!
    @data = CSV.read(DATA_PATH, headers: true).inject({}) do |result, row|
      city = row['city']
      lat = row['geo_lat'].to_f
      lon = row['geo_lon'].to_f
      result[city] = [lat, lon]
      result
    end
  end
end
