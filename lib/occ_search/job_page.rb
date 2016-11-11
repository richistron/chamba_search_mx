module OccSearch
  ##
  # Job unique page
  class JobPage
    ##
    # @param <hash> options
    def initialize(opts = {})
      @http = opts[:http] || OccSearch::HTMLPage.new
    end

    ##
    # @param <string> url
    # @return <class> self
    def load(url = '')
      @http.load url
      self
    end

    ##
    # @return <string> title
    def title
      content.css('#tittlejob_jo h1').text
    end

    ##
    # @return <string> company
    def company
      content.css('#tittlejob_jo span h3 span').text
    end

    ##
    # @return <string> sector
    def sector
      content.css('#bg_triangle_ba dd:eq(2)').text
    end

    ##
    # @return <string> businesses
    def businesses
      content.css('#bg_triangle_ba dd:eq(3)').text
    end

    ##
    # @return <string> occ_id
    def occ_id
      content.css('#bg_triangle_ba dd:eq(3)').text
    end

    ##
    # @return <string> contact_name
    def contact_name
      contact_name_text.gsub(/contacto:/i, '').strip
    end

    ##
    # @return <string> contact_email
    def contact_email
      contact_email_text.gsub(/correo:/i, '').strip
    end

    ##
    # @return <string> description
    def description
      content.css('.txt2_jo').text
    end

    private

    ##
    # @return <string> contact_name_text
    def contact_name_text
      content.css('#contactData span[itemprop=name]').text
    end

    ##
    # @return <string> contact_email_text
    def contact_email_text
      content.css('#contactData #mail_info').text
    end

    ##
    # @return <class> Nokogiri::XML::Document
    def content
      @http.content
    end
  end
end
