require 'grpc'
require_relative '../../app/lib/geocoder_service'

# Start the gRPC server
def start_grpc_server
  port = '127.0.0.1:50051'
  s = GRPC::RpcServer.new
  s.add_http2_port(port, :this_port_is_insecure)
  s.handle(GeocoderService)
  s.run_till_terminated
end

Thread.new { start_grpc_server }
