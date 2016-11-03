require "nokogiri"
require "open-uri"

module OccSearch
  class PaginationUrlScrapper
    def initialize(base_url = OccSearch::BASE_URL)
      @base_url = base_url
    end

    def find(url)
      page_html = get_url_content(url)
      pages_collection = page_html.css('#numeracion_sr').css('.actual_m,.pagina_m')
      pages = pages_collection.map { |p| p.css('a').attribute('href').text }
      pages.map! { |p| p = (p == '#') ? url : p }
    end

    def get_url_content(url)
      Nokogiri::HTML open("#{@base_url}#{url}")
    end
  end
end
