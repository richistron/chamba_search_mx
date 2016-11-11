require 'spec_helper'

describe OccSearch::SearchPagination do
  context 'getting pagination' do
    url = '/empleos-en-jalisco/desde-hace-60-dias/web-developer'
    url_scrapper = OccSearch::SearchPagination.new
    urls = url_scrapper.find url
    it 'should return a array of urls' do
      spec = '/empleos-en-jalisco/desde-hace-60-dias/web-developer'
      expect(urls[0]).to match(spec)
    end
    it 'should return a array of urls' do
      spec = '/empleos-en-jalisco/desde-hace-60-dias/web-developer?page=2'
      expect(urls[1]).to match(spec)
    end
  end
end
