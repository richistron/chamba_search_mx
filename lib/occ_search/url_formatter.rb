require 'occ_search/factories/days'
require 'occ_search/factories/locations'
require 'occ_search/factories/salaries'

module OccSearch
  ##
  # it formats occ urls base on hash options
  # @see OccSearch::LOCATIONS
  # @see OccSearch::SALARIES
  # @see OccSearch::DAYS
  class UrlFormatter
    def initialize(locations = OccSearch::LOCATIONS,
                   salaries = OccSearch::SALARIES,
                   days = OccSearch::DAYS)
      @locations = locations
      @salaries = salaries
      @days = days
    end

    ##
    # @param <query> string "web developer"
    # @params *<options> :location, :salary, :days
    def format(query, *options)
      @query = query
      @options = options.inject({}) { |acc, elem| acc.merge! elem }
      "/#{location}#{salary}#{days}/#{query_slug}"
    end

    private

    ##
    # converts query string into a url slug
    def query_slug
      remove_white_spaces(remove_spaces(downcase))
    end

    ##
    # string downcase
    def downcase
      @query.downcase
    end

    ##
    # replace space for -
    def remove_spaces(str)
      str.strip.tr(' ', '-')
    end

    ##
    # removes extra white spaces
    def remove_white_spaces(str)
      str.gsub(/[^\w-]/, '')
    end

    ##
    # returns the location string based on options or default
    # @raise Argument error when option is not valid
    def location
      return @locations[:default] unless @options[:location]
      error = proc { argument_error 'location', @locations }
      error.call unless option_exists?(@locations, :location)
      @locations[@options[:location].to_sym]
    end

    ##
    # returns the salary string based on options
    # @raise Argument error when option is not valid
    def salary
      return unless @options.key? :salary
      error = proc { argument_error 'salary', @salaries }
      error.call unless option_exists?(@salaries, :salary)
      "/#{@salaries[@options[:salary].to_sym]}"
    end

    ##
    # returns the days string based on options
    # @raise Argument error when option is not valid
    def days
      return unless @options.key? :days
      error = proc { argument_error 'days', @days }
      error.call unless option_exists?(@days, :days)
      "/#{@days[@options[:days].to_s.to_sym]}"
    end

    ##
    # Argument error parser
    def argument_error(arg_name, available_options)
      msg = "#{arg_name}: {OPTION} |"
      msg += "avalilable options #{available_options.keys.join(', ')}"
      raise ArgumentError, msg
    end

    ##
    # gets value from the options hash
    # @returm <boolean>
    def option_exists?(hash, key)
      hash.key? @options[key].to_s.to_sym
    end
  end
end
