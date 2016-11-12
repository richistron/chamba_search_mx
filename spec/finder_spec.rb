require 'spec_helper'

describe OccSearch::Finder do
  finder = OccSearch::Finder.new

  context 'smoke tests' do
    it 'should not allows empty searches' do
      expect { finder.find('') }.to raise_error(ArgumentError)
    end

    it 'should not allows integer for searches' do
      expect { finder.find(5) }.to raise_error(ArgumentError)
    end

    it 'should not allows nil for searches' do
      expect { finder.find(nil) }.to raise_error(ArgumentError)
    end

    it 'should not allows boolean for searches' do
      expect { finder.find(true) }.to raise_error(ArgumentError)
    end
  end

  # this tests are actually doing networks requests if you want to test this
  # you will need to use the command bellow
  # SLOW_TESTS=true rspec
  if ENV['SLOW_TESTS']
    context 'slow tests' do
      jobs = finder.find('web developer', location: 'jal', days: 14).jobs

      it 'should return itself after use so you can chain methods' do
        expect(jobs).to be_instance_of(Array)
      end
    end
  end
end
