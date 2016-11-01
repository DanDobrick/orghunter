module Orghunter
  class Search

    def initialize(args)
      @search_term = args[:search_term] || ''
      @city = args[:city] || ''
      @state = args[:state] || ''
      @zip_code = args[:zip_code] || ''
      @category = args[:category] || ''
      if args[:eligible] == true
        @eligible = 1
      else
        @eligible = ''
      end
      @eligible = args[:eligible] || ''
      @rows = args[:rows] || 20
      @start = args[:start] || 0


    end

  end
end