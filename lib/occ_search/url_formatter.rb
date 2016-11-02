require "occ_search/locations"

module OccSearch
  class UrlFormatter
    def initialize(locations = OccSearch.locations)
      @locations = locations
    end

    def format(query, *options)
      @query = query
      @options = options.inject({}){ |_options, o| _options.merge! o }
      "/#{location}#{salary}#{since}/#{query_slug}"
    end

    private
    def query_slug
      @query.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def location
      return @locations[:default] unless @options[:location]
      current_location
    end

    def current_location
      return location_not_found unless @locations.has_key? @options[:location]
      @locations[@options[:location]]
    end

    def location_not_found
      raise ArgumentError, ":location => :option | avalilable options #{@locations.keys}"
    end

    def salary
      if @options[:salary]
        '/10000-a-15000-pesos'
      end
    end

    def since
      if @options[:since]
        '/desde-hace-2-dias'
      end
    end
  end
end
