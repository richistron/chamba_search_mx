require 'spec_helper'

describe OccSearch::JobDecorator do
  context 'smoke tests' do
    options = {
      businesses: 'businesses',
      company: 'company',
      contact_email: 'contact_email',
      contact_name: 'contact_name',
      description: 'description',
      occ_id: 'occ_id',
      sector: 'sector',
      title: 'title',
      url: 'url'
    }
    job_decorator = OccSearch::JobDecorator.new options

    it 'businesses should return a string' do
      expect(job_decorator.businesses).to be_instance_of(String)
    end

    it 'company should return a string' do
      expect(job_decorator.company).to be_instance_of(String)
    end

    it 'contact_email should return a string' do
      expect(job_decorator.contact_email).to be_instance_of(String)
    end

    it 'contact_name should return a string' do
      expect(job_decorator.contact_name).to be_instance_of(String)
    end

    it 'description should return a string' do
      expect(job_decorator.description).to be_instance_of(String)
    end

    it 'occ_id should return a string' do
      expect(job_decorator.occ_id).to be_instance_of(String)
    end

    it 'sector should return a string' do
      expect(job_decorator.sector).to be_instance_of(String)
    end

    it 'title should return a string' do
      expect(job_decorator.title).to be_instance_of(String)
    end

    it 'url should return a string' do
      expect(job_decorator.url).to be_instance_of(String)
    end

    it 'the value of businesses should be businesses' do
      expect(job_decorator.businesses).to match('businesses')
    end

    it 'the value of company should be company' do
      expect(job_decorator.company).to match('company')
    end

    it 'the value of contact_email should be contact_email' do
      expect(job_decorator.contact_email).to match('contact_email')
    end

    it 'the value of contact_name should be contact_name' do
      expect(job_decorator.contact_name).to match('contact_name')
    end

    it 'the value of description should be description' do
      expect(job_decorator.description).to match('description')
    end

    it 'the value of occ_id should be occ_id' do
      expect(job_decorator.occ_id).to match('occ_id')
    end

    it 'the value of sector should be sector' do
      expect(job_decorator.sector).to match('sector')
    end

    it 'the value of title should be title' do
      expect(job_decorator.title).to match('title')
    end

    it 'the value of url should be url' do
      expect(job_decorator.url).to match('url')
    end
  end
end
