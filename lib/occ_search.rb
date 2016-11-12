require 'occ_search/factories/base_url'
require 'occ_search/factories/days'
require 'occ_search/factories/locations'
require 'occ_search/factories/salaries'
require 'occ_search/finder'
require 'occ_search/html_page'
require 'occ_search/job_decorator'
require 'occ_search/job_page'
require 'occ_search/pagination'
require 'occ_search/search_page'
require 'occ_search/url_formatter'

##
# OccSearch module allows you to search jobs and get back ruby object with
# useful information about the position openenings published on occ.com.mx
module OccSearch
  def self.find(opts = {})
    finder = opts[:finder] || OccSearch::Finder.new
    search_options = {
      location: opts[:location],
      salary: opts[:salary],
      days: opts[:days]
    }
    finder.find(opts[:search], search_options).jobs
  end
end
