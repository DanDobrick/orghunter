require "orghunter/version"
require 'orghunter/configuration'
require 'orghunter/charity'
require 'orghunter/search'


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

end
