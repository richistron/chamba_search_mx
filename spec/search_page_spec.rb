require 'spec_helper'

describe OccSearch::SearchPage do
  url = '/empleos-en-jalisco/desde-hace-60-dias/web-developer'
  page = OccSearch::SearchPage.new
  page.load url

  describe page.job_urls do
    it { is_expected.to(all(be_a(String).and(include('/Empleo/Oferta/')))) }
  end
end
