module Orghunter
  class Search
    attr_reader :results

    def initialize(args)
#     I'm sure there's a better way than all of these ifs. I need to figure out the behavior with ||= or || or
# Ternary is the same, but I've never used it so maybe I will
      @search_term = "&searchTerm=#{args[:search_term]}" if args [:search_term]
      @city = "&city=#{args[:city]}" if args[:city]
      @state = "&state=#{args[:state]}"
      @zip_code = "&zipCode=#{args[:zip_code]}"
      @category = "&category=#{args[:category]}"
      if args[:eligible] == true
        @eligible = "&eligible=1"
      else
        @eligible = ''
      end
      @rows = "&rows=#{args[:rows]}"
      @start = "&start=#{args[:start]}"
      query_api
    end

    def create_string
      @search_string = "http://data.orghunter.com/v1/charitysearch?user_key=#{Orghunter.configuration.api_key}#{@search_term}#{@city}#{@state}#{@zip_code}#{@category}#{@eligible}#{@rows}#{@start}"
    end

    def query_api
      create_string
      @results = []
    end

  end
end