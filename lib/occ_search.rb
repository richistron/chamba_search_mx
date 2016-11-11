require 'occ_search/html_page'
require 'occ_search/pagination'
require 'occ_search/job_page'
require 'occ_search/factories/base_url'
require 'occ_search/url_formatter'
require 'occ_search/factories/days'
require 'occ_search/factories/locations'
require 'occ_search/factories/salaries'

##
# OccSearch module allows you to search jobs and get back ruby object with
# useful information about the position openenings published on occ.com.mx
module OccSearch
  # formater = OccSearch::UrlFormatter
  # url = formatter.format 'ruby on rails', location: 'jal', days: 30,
  # salary: '20000-30000'
  # pagination = OccSearch::Pagination.new
  # pagination.load url
  # pages = pagination.urls.map do |page_url|
  #   page = OccSearch::JobPage.new
  #   page.load page_url
  #   page
  # end
end
