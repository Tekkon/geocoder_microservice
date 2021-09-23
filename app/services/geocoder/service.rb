module Geocoder
  class Service
    prepend BasicService

    param :city

    def call
      data = Geocoder.geocode(city)

      fail!(I18n.t(:error, scope: 'services.geocoder')) unless data
    end
  end
end
