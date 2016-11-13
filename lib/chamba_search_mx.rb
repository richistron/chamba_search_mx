require 'chamba_search_mx/factories/base_url'
require 'chamba_search_mx/factories/days'
require 'chamba_search_mx/factories/locations'
require 'chamba_search_mx/factories/salaries'
require 'chamba_search_mx/finder'
require 'chamba_search_mx/html_page'
require 'chamba_search_mx/job_decorator'
require 'chamba_search_mx/job_page'
require 'chamba_search_mx/pagination'
require 'chamba_search_mx/search_page'
require 'chamba_search_mx/url_formatter'

##
# ChambaSearchMx module allows you to search jobs and get back a ruby object
# with useful information about the position openenings published on the web
module ChambaSearchMx
  ##
  # Public api of this module. This method takes case of parsing the opts
  # argument into a internal api, this acts basically as a connector
  def self.find(opts = {})
    finder = opts[:finder] || ChambaSearchMx::Finder.new
    search_options = {
      location: opts[:location],
      salary: opts[:salary],
      days: opts[:days]
    }
    finder.find(opts[:search], search_options).jobs
  end
end
