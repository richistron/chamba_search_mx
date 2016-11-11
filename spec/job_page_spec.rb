require 'spec_helper'

describe OccSearch::JobPage do
  url = '/empleos-en-jalisco/desde-hace-60-dias/web-developer'
  page = OccSearch::JobPage.new
  page.load url

  it 'should be a Nokogiri::XML::NodeSet instance' do
    expect(page.jobs).to be_instance_of(Nokogiri::XML::NodeSet)
  end
end
