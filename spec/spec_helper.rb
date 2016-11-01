$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "orghunter"
require "vcr"
require "httparty"
# require 'webmock'

ORGHUNTER_API_KEY = '3de10e9f24f7ca4c69b9e327ee6a4e68'

VCR.configure do |config|
  config.cassette_library_dir = "../test/fixtures/cassettes"
  config.hook_into :webmock # or :fakeweb
  config.default_cassette_options = { record: :once }   
end

# class VCRTest < Test::Unit::TestCase
#   def test_example_dot_com
#     VCR.use_cassette("synopsis") do
#       response = Net::HTTP.get_response(URI('http://www.iana.org/domains/reserved'))
#       assert_match /Example domains/, response.body
#     end
#   end
# end