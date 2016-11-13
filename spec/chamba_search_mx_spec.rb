require 'spec_helper'

describe ChambaSearchMx do
  context 'smoke tests' do
    context 'invalid parameters' do
      context 'invalid search' do
        it 'search with no hash key' do
          test = proc { ChambaSearchMx.find 'invalid search' }
          expect(&test).to raise_error(TypeError)
        end

        it 'search with non string search' do
          test = proc { ChambaSearchMx.find(search: {}) }
          expect(&test).to raise_error(ArgumentError)
        end
      end

      context 'invalid location' do
        it 'invalid location' do
          test = proc do
            ChambaSearchMx.find(search: 'web developer', location: 'tu cola')
          end
          expect(&test).to raise_error(ArgumentError)
        end
        it 'invalid location' do
          test = proc do
            ChambaSearchMx.find(search: 'web developer', location: 5)
          end
          expect(&test).to raise_error(ArgumentError)
        end
      end

      context 'invalid salary' do
        it 'invalid salary' do
          test = proc do
            ChambaSearchMx.find(search: 'web developer', salary: 5)
          end
          expect(&test).to raise_error(ArgumentError)
        end
        it 'invalid salary' do
          test = proc do
            ChambaSearchMx.find(search: 'web developer', salary: 'cien')
          end
          expect(&test).to raise_error(ArgumentError)
        end
      end

      context 'invalid days' do
        it 'invalid days' do
          test = proc do
            ChambaSearchMx.find(search: 'web developer', days: 'adfadf')
          end
          expect(&test).to raise_error(ArgumentError)
        end
        it 'invalid days' do
          test = proc do
            ChambaSearchMx.find(search: 'web developer', days: '15')
          end
          expect(&test).to raise_error(ArgumentError)
        end
      end
    end
  end

  # this tests are actually doing networks requests if you want to test this
  # you will need to use the command bellow
  # SLOW_TESTS=true rspec
  if ENV['SLOW_TESTS']
    context 'slow tests' do
      search_options = {
        search: 'web developer',
        days: 14,
        location: 'jal',
        salary: '15000-20000'
      }
      jobs = ChambaSearchMx.find(search_options)

      it 'should have a businesses method' do
        businesses = jobs.map(&:businesses)
        expect(businesses).to all(be_an(String))
      end

      it 'should have a company method' do
        company = jobs.map(&:company)
        expect(company).to all(be_an(String))
      end

      it 'should have a contact_email method' do
        contact_email = jobs.map(&:contact_email)
        expect(contact_email).to all(be_an(String))
      end

      it 'should have a contact_name method' do
        contact_name = jobs.map(&:contact_name)
        expect(contact_name).to all(be_an(String))
      end

      it 'should have a description method' do
        description = jobs.map(&:description)
        expect(description).to all(be_an(String))
      end

      it 'should have a sector method' do
        sector = jobs.map(&:sector)
        expect(sector).to all(be_an(String))
      end

      it 'should have a title method' do
        title = jobs.map(&:title)
        expect(title).to all(be_an(String))
      end

      it 'should have a url method' do
        url = jobs.map(&:url)
        expect(url).to all(be_an(String))
      end
    end
  end
end
