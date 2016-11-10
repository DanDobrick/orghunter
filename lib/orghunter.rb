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

  def self.data_from_query(uri)
    query_uri = URI::encode(uri)
    response = Net::HTTP.get_response(URI(query_uri))
    JSON.parse(response.body)['data']
  end

  def self.all_categories
    categories_json = self.data_from_query("http://data.orghunter.com/v1/charitysearch?user_key=#{Orghunter.configuration.api_key}")
    results = categories_json.map{|category_hash| Category.new(category_hash)}
  end

  def self.basic_info(ein)
    uri = "http://data.orghunter.com/v1/charitybasic?user_key=#{Orghunter.configuration.api_key}&ein=#{ein}"
    charity_hash = self.data_from_query(uri)
    if charity_hash
      return Charity.new(charity_hash)
    else
      return "No results for ein: #{ein}"
    end
  end


end
