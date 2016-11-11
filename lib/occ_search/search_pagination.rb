module OccSearch
  ##
  # helps find a search page pagination links
  class SearchPagination
    ##
    # @param <hash>
    # @see OccSearch::BASE_URL
    def initialize(opts = {})
      @http = opts[:http] || OccSearch::HTMLPage.new
    end

    ##
    # @param <string> search page url
    def find(url)
      @http.load url
      find_pages.map! { |p| p == '#' ? url : p }
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
