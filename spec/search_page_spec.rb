require 'spec_helper'

describe ChambaSearchMx::SearchPage do
  url = '/empleos-en-jalisco/desde-hace-60-dias/web-developer'
  page = ChambaSearchMx::SearchPage.new
  page.load url

  describe page.job_urls do
    it { is_expected.to(all(be_a(String).and(include('/Empleo/Oferta/')))) }
  end
end
