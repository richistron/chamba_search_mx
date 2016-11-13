require 'spec_helper'

describe ChambaSearchMx::HTMLPage do
  if ENV['SLOW_TESTS']
    context 'slow tests' do
      it 'content property should be an instance of Nokogiri::HTML::Document' do
        page = ChambaSearchMx::HTMLPage.new base_url: ''
        page.load 'http://google.com'
        expect(page.content).to be_instance_of(Nokogiri::HTML::Document)
      end
    end
  end
end
