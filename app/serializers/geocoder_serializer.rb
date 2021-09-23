# frozen_string_literal: true

class GeocoderSerializer
  include FastJsonapi::ObjectSerializer

  attributes :city
end
