module OccSearch
  ##
  # cleaner job representation
  class JobDecorator
    def initialize(options = {})
      @options = options
    end

    def businesses
      @options[:businesses]
    end

    def company
      @options[:company]
    end

    def contact_email
      @options[:contact_email]
    end

    def contact_name
      @options[:contact_name]
    end

    def description
      @options[:description]
    end

    def occ_id
      @options[:occ_id]
    end

    def sector
      @options[:sector]
    end

    def title
      @options[:title]
    end

    def url
      @options[:url]
    end
  end
end
