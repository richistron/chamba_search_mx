require 'spec_helper'

describe OccSearch::Pagination do
  url = '/empleos-en-jalisco/desde-hace-60-dias/web-developer'
  pagination = OccSearch::Pagination.new
  pagination.load url

  it 'should return a array of urls' do
    spec = '/empleos-en-jalisco/desde-hace-60-dias/web-developer'
    expect(pagination.urls[0]).to match(spec)
  end

  it 'should return a array of urls' do
    spec = '/empleos-en-jalisco/desde-hace-60-dias/web-developer?page=2'
    expect(pagination.urls[1]).to match(spec)
  end
end
