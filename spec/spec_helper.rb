$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "orghunter"
require "vcr"
require "httparty"


VCR.configure do |config|
  config.cassette_library_dir = "../test/fixtures/cassettes"
  config.hook_into :webmock # or :fakeweb
  config.default_cassette_options = { record: :once }   
end

RSpec.configure do |config|
  config.before(:all) do 
    Orghunter.configure do |config|
      config.api_key = ENV['ORGHUNTER_API_KEY']
    end
  end  
end