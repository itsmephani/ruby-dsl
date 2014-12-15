require 'webrick'
require 'json' 
include WEBrick
require "./rest_module.rb" 
require "./rest.rb"
def start_webrick(config = {})
  config.update(:Port => 9955)     
  server = HTTPServer.new(config)
  yield server if block_given?
  ['INT', 'TERM'].each {|signal| 
    trap(signal) {server.shutdown}
  }
  server.start
end
 
start_webrick(:DocumentRoot => '/home/heresy/ruby_dsl') { | server |
  server.mount('/', RestServlet)
}