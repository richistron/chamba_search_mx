require 'nokogiri'
require 'open-uri'

module OccSearch
  ##
  # helps find a search page pagination links
  class HTMLPage
    attr_reader :content
    ##
    # @param <hash>
    # @see OccSearch::BASE_URL
    def initialize(opts = {})
      @base_url = opts[:base_url] || OccSearch::BASE_URL
    end

    ##
    # loads Kokogiri::HTML:Document as @content which can be read
    # @param <string> occ url
    def load(url)
      @content = Nokogiri::HTML open("#{@base_url}#{url}")
    end
  end
end
