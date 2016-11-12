require 'spec_helper'

describe OccSearch do
  context 'smoke tests' do
    context 'invalid parameters' do
      context 'invalid search' do
        it 'search with no hash key' do
          test = proc { OccSearch.find 'invalid search' }
          expect(&test).to raise_error(TypeError)
        end

        it 'search with non string search' do
          expect { OccSearch.find(search: {}) }.to raise_error(ArgumentError)
        end
      end

      context 'invalid location' do
        it 'invalid location' do
          test = proc do
            OccSearch.find(search: 'web developer', location: 'tu cola')
          end
          expect(&test).to raise_error(ArgumentError)
        end
        it 'invalid location' do
          test = proc do
            OccSearch.find(search: 'web developer', location: 5)
          end
          expect(&test).to raise_error(ArgumentError)
        end
      end

      context 'invalid salary' do
        it 'invalid salary' do
          test = proc do
            OccSearch.find(search: 'web developer', salary: 5)
          end
          expect(&test).to raise_error(ArgumentError)
        end
        it 'invalid salary' do
          test = proc do
            OccSearch.find(search: 'web developer', salary: 'cien')
          end
          expect(&test).to raise_error(ArgumentError)
        end
      end

      context 'invalid days' do
        it 'invalid days' do
          test = proc do
            OccSearch.find(search: 'web developer', days: 'adfadf')
          end
          expect(&test).to raise_error(ArgumentError)
        end
        it 'invalid days' do
          test = proc do
            OccSearch.find(search: 'web developer', days: '15')
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
      # TODO: create tests for the jobs array
      # jobs = OccSearch.find(search: 'web developer', days: 14,
      # location: 'jal', salary: '15000-20000')
    end
  end
end
