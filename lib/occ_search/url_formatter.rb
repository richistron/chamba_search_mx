require "occ_search/factories/days"
require "occ_search/factories/locations"
require "occ_search/factories/salaries"

module OccSearch
  class UrlFormatter
    def initialize(locations = OccSearch.locations,
                   salaries = OccSearch.salaries,
                   days = OccSearch.days)
      @locations = locations
      @salaries = salaries
      @days = days
    end

    def format(query, *options)
      @query = query
      @options = options.inject({}){ |_options, o| _options.merge! o }
      "/#{location}#{salary}#{days}/#{query_slug}"
    end

    private
    def query_slug
      @query.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def location
      return @locations[:default] unless @options[:location]
      return argument_error 'location', @locations unless @locations.has_key? @options[:location].to_sym
      @locations[@options[:location].to_sym]
    end

    def salary
      return unless @options.has_key? :salary
      return argument_error 'salary', @salaries unless @salaries.has_key? @options[:salary].to_sym
      "/#{@salaries[@options[:salary].to_sym]}"
    end

    def days
      return unless @options.has_key? :days
      return argument_error 'days', @days unless @days.has_key? @options[:days].to_s.to_sym
      "/#{@days[@options[:days].to_s.to_sym]}"
    end

    def argument_error(arg_name, available_options)
      msg = "#{arg_name}: {OPTION} |"
      msg += "avalilable options #{available_options.keys.join(', ')}"
      raise ArgumentError, msg
    end
  end
end
