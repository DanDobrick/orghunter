$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "orghunter"
require 'pry'
require "vcr"
# require 'webmock/rspec'  
# WebMock.disable_net_connect!(allow_localhost: true)  


VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
  # config.default_cassette_options = { record: :once }   
end


RSpec.configure do |config|
  config.before(:all) do 
    Orghunter.configure do |config|
      config.api_key = ENV['ORGHUNTER_API_KEY']
    end
  end  
end