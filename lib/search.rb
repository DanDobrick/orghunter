module Orghunter
  class Search
    attr_reader :results

    def initialize(args)
#     I'm sure there's a better way than all of these ifs. I need to figure out the behavior with ||= or || or
# Ternary is the same, but I've never used it so maybe I will
      @ein          = args[:ein]          ? "&ein=#{args[:ein]}"                  : 
      @search_term  = args[:search_term] ? "&searchTerm=#{args[:search_term]}"    : ''
      @city         = args[:city]         ? "&city=#{args[:city]}"                : ''
      @state        = args[:state]        ? "&state=#{args[:state]}"              : ''
      @zip_code     = args[:zip_code]     ? "&zipCode=#{args[:zip_code]}"         : ''
      @category     = args[:category]     ? "&category=#{args[:category]}"        : ''
      @eligible     = args[:eligible]     ? "&eligible=1"                         : ''
      @rows         = args[:rows]         ? "&rows=#{args[:rows]}"                : ''
      @start        = args[:start]        ? "&start=#{args[:start]}"              : ''
      query_api
    end

    def create_string
      @search_string = "http://data.orghunter.com/v1/charitysearch?user_key=#{Orghunter.configuration.api_key}#{@ein}#{@search_term}#{@city}#{@state}#{@zip_code}#{@category}#{@eligible}#{@rows}#{@start}"
    end

    def query_api
      create_string
      @results = []
    end

  end
end