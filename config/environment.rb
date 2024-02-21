# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require_relative 'application_loader'
ApplicationLoader.load_app!
