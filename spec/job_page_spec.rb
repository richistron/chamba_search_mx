require 'spec_helper'

describe ChambaSearchMx::JobPage do
  if ENV['SLOW_TESTS']
    context 'slow tests' do
      search_url = '/empleos-en-jalisco/desde-hace-60-dias/web-developer'
      search_page = ChambaSearchMx::SearchPage.new
      search_page.load search_url
      url = search_page.job_urls.first
      job_page = ChambaSearchMx::JobPage.new
      job_page.load(url)

      it 'should reponse to load' do
        expect(job_page).to respond_to(:load)
      end

      it 'load should return itself' do
        expect(job_page.load(url)).to be_instance_of(ChambaSearchMx::JobPage)
      end

      it 'data should be an instance of ChambaSearchMx::JobDecorator' do
        expect(job_page.data).to be_instance_of(ChambaSearchMx::JobDecorator)
      end
    end
  end
end
