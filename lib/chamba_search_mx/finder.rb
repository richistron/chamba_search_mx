module ChambaSearchMx
  ##
  # finds jobs and returns simplified objects of them selfs
  class Finder
    attr_reader :jobs
    def initialize(options = {})
      @formatter = options[:formatter] || ChambaSearchMx::UrlFormatter.new
      @pagination = options[:pagination] || ChambaSearchMx::Pagination.new
      @search_page = options[:search_page] || ChambaSearchMx::SearchPage.new
      @job = options[:job] || ChambaSearchMx::JobPage.new
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
      raise ArgumentError, error_msg unless search_valid?
    end

    def search_valid?
      if @search.class != String || @search.empty?
        false
      else
        true
      end
    end

    def find_jobs
      @jobs = job_urls.map { |url| @job.load(url).data }
    end

    def job_urls
      pagination_urls.map { |url| @search_page.load(url).job_urls }.flatten
    end

    def pagination_urls
      @pagination.load(format_url).urls
    end

    def format_url
      opts = search_options
      @formatter.format @search, opts
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
