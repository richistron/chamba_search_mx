require "nokogiri"
require "open-uri"
module OccSearch
  ##
  # OccSearch::PaginationUrlScrapper is used for getting the pagination urls
  # in a form of an array, this class uses OccBase::BASE_URL but it can be
  # changed for mocking purpuses
  class PaginationUrlScrapper
    ##
    # @param <base_url> string
    # @see OccSearch::BASE_URL
    def initialize(base_url = OccSearch::BASE_URL)
      @base_url = base_url
    end
    ##
    # finds pagination search urls
    #
    # @param: <url> string
    # @return array
    def find(url)
      @nokogiri_page = get_url_content url
      get_pages.map! { |p| p = (p == '#') ? url : p }
    end
    private
    ##
    # @return <array> of url strings
    def get_pages
      nokogiri_page_links.map do |p|
        p.css('a').attribute('href').text
      end
    end
    ##
    # @return <object> Nokogiri HTML element
    def nokogiri_page_links
      @nokogiri_page.css('#numeracion_sr').css('.actual_m,.pagina_m')
    end
    ##
    # @param <url> string
    # @return <Onject> Nokogiri HTML object
    # @see http://www.nokogiri.org
    def get_url_content(url)
      Nokogiri::HTML open("#{@base_url}#{url}")
    end
  end
end
