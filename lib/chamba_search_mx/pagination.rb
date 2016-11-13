module ChambaSearchMx
  ##
  # provides the url of the search  pagination
  class Pagination
    attr_reader :urls
    ##
    # @param <hash> opts
    # @see ChambaSearchMx::BASE_URL
    def initialize(opts = {})
      @urls = []
      @http = opts[:http] || ChambaSearchMx::HTMLPage.new
    end

    ##
    # @param <string> search page url
    # @return <class> self
    def load(url)
      @http.load url
      @urls = find_pages.map! { |p| p == '#' ? url : p }
      self
    end

    private

    ##
    # @return <array> of strings
    def find_pages
      page_links.map { |p| p.css('a').attribute('href').text }
    end

    ##
    # @return <array> of nokogiri objects
    def page_links
      @http.content.css('#numeracion_sr').css('.actual_m,.pagina_m')
    end
  end
end
