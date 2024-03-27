# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: geocoder.proto

require 'google/protobuf'


descriptor_data = "\n\x0egeocoder.proto\x12\x08geocoder\"\x14\n\x04\x43ity\x12\x0c\n\x04name\x18\x01 \x01(\t\"\'\n\x0b\x43oordinates\x12\x0b\n\x03lat\x18\x01 \x01(\x02\x12\x0b\n\x03lon\x18\x02 \x01(\x02\x32\x45\n\x0fGeocoderService\x12\x32\n\x07Geocode\x12\x0e.geocoder.City\x1a\x15.geocoder.Coordinates\"\x00\x62\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Geocoder
  City = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("geocoder.City").msgclass
  Coordinates = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("geocoder.Coordinates").msgclass
end