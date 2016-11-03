require "spec_helper"

describe OccSearch::PaginationUrlScrapper do
  url_scrapper = OccSearch::PaginationUrlScrapper.new

  it 'should return a array of urls' do
    url = '/empleos-en-jalisco/desde-hace-60-dias/web-developer'
    expect(url_scrapper.find(url)).to be_instance_of(Array)
  end

  it 'should return a array of urls' do
    url = '/empleos-en-jalisco/desde-hace-60-dias/web-developer'
    urls = url_scrapper.find(url)
    expect(urls[0]).to match('/empleos-en-jalisco/desde-hace-60-dias/web-developer')
    expect(urls[1]).to match('/empleos-en-jalisco/desde-hace-60-dias/web-developer?page=2')
  end
end
