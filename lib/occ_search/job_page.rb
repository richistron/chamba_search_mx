module OccSearch
  ##
  # Occ search landing page
  class JobPage
    def initialize(opts = {})
      @http = opts[:http] || OccSearch::HTMLPage.new
    end

    ##
    # @param <string> search page url
    def load(url)
      @http.load url
    end

    ##
    # Nokogiri:XML:NodeSet instance
    def jobs
      @http.content.css('#results_sr').css('.job-normal,.standoutnor-jobn')
    end
  end
end
