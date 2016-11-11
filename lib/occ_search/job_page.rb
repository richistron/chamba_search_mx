module OccSearch
  ##
  # Occ search landing page
  class JobPage
    def initialize(opts = {})
      @http = opts[:http] || OccSearch::HTMLPage.new
    end

    def load(url = '')
      @http.load url
      self
    end

    def title
      content.css('#tittlejob_jo h1').text
    end

    def company
      content.css('#tittlejob_jo span h3 span').text
    end

    def sector
      content.css('#bg_triangle_ba dd:eq(2)').text
    end

    def businesses
      content.css('#bg_triangle_ba dd:eq(3)').text
    end

    def occ_id
      content.css('#bg_triangle_ba dd:eq(3)').text
    end

    def contact_name
      contact_name_text.gsub(/contacto:/i, '').strip
    end

    def contact_email
      contact_email_text.gsub(/correo:/i, '').strip
    end

    def description
      content.css('.txt2_jo').text
    end

    private

    def contact_name_text
      content.css('#contactData span[itemprop=name]').text
    end

    def contact_email_text
      content.css('#contactData #mail_info').text
    end

    def content
      @http.content
    end
  end
end
