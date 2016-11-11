require 'nokogiri'
require 'open-uri'

module OccSearch
  ##
  # loads web page using nokogiri
  class HTMLPage
    attr_reader :content
    ##
    # @param <hash> options
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
