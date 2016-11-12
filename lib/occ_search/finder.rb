module OccSearch
  ##
  # finds jobs and returns simplified objects of them selfs
  class Finder
    attr_reader :jobs
    def initialize(options = {})
      @url_formatter = options[:url_formatter] || OccSearch::UrlFormatter.new
      @pagination = options[:pagination] || OccSearch::Pagination.new
      @search_page = options[:search_page] || OccSearch::SearchPage.new
      @job = options[:job] || OccSearch::JobPage.new
    end

    def find(search, options = {})
      @search = search
      @options = options
      validate_arguments
      find_jobs
      self
    end

    def validate_arguments
      error_msg = 'search must be a non empty string'
      raise ArgumentError, error_msg if search_valid?
    end

    def search_valid?
      @search.class != String || @search.empty?
    end

    def find_jobs
      @jobs = job_urls.map { |url| @job.load(url).load_clean_object }
    end

    def job_urls
      pagination_urls.map { |url| @search_page.load(url).job_urls }.flatten
    end

    def pagination_urls
      @pagination.load(format_url).urls
    end

    def format_url
      opts = search_options
      @url_formatter.format @search, opts
    end

    def search_options
      {
        location: @options[:location] || 'default',
        days: @options[:days] || 'default',
        salary: @options[:salary] || 'default'
      }
    end
  end
end
