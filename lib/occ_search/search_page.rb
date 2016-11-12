module OccSearch
  ##
  # Occ search landing page
  class SearchPage
    def initialize(opts = {})
      @http = opts[:http] || OccSearch::HTMLPage.new
    end

    ##
    # @param <string> search page url
    def load(url)
      @http.load url
      self
    end

    ##
    # @return <array> of strings
    def job_urls
      job_elements.map do |job|
        job.css('.title_modn_sr a').attribute('href').value
      end
    end

    private

    ##
    # Nokogiri:XML:NodeSet instance
    def job_elements
      @http.content.css('#results_sr').css('.job-normal,.standoutnor-jobn')
    end
  end
end
