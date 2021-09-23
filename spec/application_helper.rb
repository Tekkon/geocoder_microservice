# frozen_string_literal: true

require 'spec_helper'

ENV['RACK_ENV'] ||= 'test'

require_relative '../config/environment'
Dir["#{Application.root}/spec/support/**/*.rb"].each { |file| require file }

abort('You run test in production mode. Please don\'t do this!') if Application.environment == :production

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include RouteHelpers, type: :routes
end
