module ChambaSearchMx
  ##
  # finds jobs and returns simplified objects of them selfs
  class Finder
    ##
    # @attribute <Array>
    attr_reader :jobs
    def initialize(options = {})
      @formatter = options[:formatter] || ChambaSearchMx::UrlFormatter.new
      @pagination = options[:pagination] || ChambaSearchMx::Pagination.new
      @search_page = options[:search_page] || ChambaSearchMx::SearchPage.new
      @job = options[:job] || ChambaSearchMx::JobPage.new
    end

    ##
    # @param <String> search
    # @param <Hash> options
    # @return <Class> self
    def find(search, options = {})
      @search = search
      @options = options
      validate_arguments
      find_jobs
      self
    end

    private

    ##
    # @raise <ArgumentError>
    def validate_arguments
      error_msg = 'search must be a non empty string'
      raise ArgumentError, error_msg unless search_valid?
    end

    ##
    # @return <Boolean>
    def search_valid?
      return false if @search.class != String
      return false if @search.empty?
      true
    end

    ##
    # @return <Array>
    def find_jobs
      @jobs = job_urls.map { |url| @job.load(url).data }
    end

    ##
    # @return <Array>
    def job_urls
      pagination_urls.map { |url| @search_page.load(url).job_urls }.flatten
    end

    ##
    # @return <Array>
    def pagination_urls
      @pagination.load(format_url).urls
    end

    ##
    # @returm <string>
    def format_url
      opts = search_options
      @formatter.format @search, opts
    end

    ##
    # @return <Hash>
    def search_options
      {
        location: @options[:location] || 'default',
        days: @options[:days] || 'default',
        salary: @options[:salary] || 'default'
      }
    end
  end
end
