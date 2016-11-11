require 'spec_helper'

describe OccSearch::JobPage do
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

  it "title should return a string:'#{job_page.title}'" do
    expect(job_page.title).to be_instance_of(String)
  end

  it "company should return a string:'#{job_page.company}'" do
    expect(job_page.company).to be_instance_of(String)
  end

  it "sector should return a string:'#{job_page.sector}'" do
    expect(job_page.sector).to be_instance_of(String)
  end

  it "businesses should return a string:'#{job_page.businesses}'" do
    expect(job_page.businesses).to be_instance_of(String)
  end

  it "occ_id should return a string:'#{job_page.occ_id}'" do
    expect(job_page.occ_id).to be_instance_of(String)
  end

  it "contact_name should return a string:'#{job_page.contact_name}'" do
    expect(job_page.contact_name).to be_instance_of(String)
  end

  it "contact_email should return a string:'#{job_page.contact_email}'" do
    expect(job_page.contact_email).to be_instance_of(String)
  end

  it "contact_email should return a string:'#{job_page.description}'" do
    expect(job_page.description).to be_instance_of(String)
  end
end
