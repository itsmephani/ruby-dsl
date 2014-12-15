require 'rubygems'
require 'webrick'
require "./question.rb"
require "./save.rb"
#require 'dbi'

# Initialize our WEBrick server
if $0 == __FILE__ then
  server = WEBrick::HTTPServer.new(:Port => 8000)
  server.mount "/questions", WebForm
  server.mount "/save", PersistAnswers
  trap "INT" do server.shutdown end
  server.start
end