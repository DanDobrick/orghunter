require "orghunter/version"
require 'orghunter/configuration'
require 'orghunter/charity'
require 'orghunter/search'
require 'orghunter/category'


module Orghunter
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.all_categories
    query_uri = URI::encode("http://data.orghunter.com/v1/charitysearch?user_key=#{Orghunter.configuration.api_key}")
    response = Net::HTTP.get_response(URI(query_uri))
    categories_json = JSON.parse(response.body)['data']
    results = categories_json.map{|category_hash| Category.new(category_hash)}
  end

end
