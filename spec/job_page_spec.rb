require 'spec_helper'

describe OccSearch::JobPage do
  if ENV['SLOW_TESTS']
    context 'slow tests' do
      search_url = '/empleos-en-jalisco/desde-hace-60-dias/web-developer'
      search_page = OccSearch::SearchPage.new
      search_page.load search_url
      url = search_page.job_urls.first
      job_page = OccSearch::JobPage.new
      job_page.load(url)

      it 'should reponse to load' do
        expect(job_page).to respond_to(:load)
      end

      it 'load should return itself' do
        expect(job_page.load(url)).to be_instance_of(OccSearch::JobPage)
      end

      it 'data should be an instance of OccSearch::JobDecorator' do
        expect(job_page.data).to be_instance_of(OccSearch::JobDecorator)
      end
    end
  end
end
