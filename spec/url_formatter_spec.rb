require 'spec_helper'

describe OccSearch::UrlFormatter do
  formatter = OccSearch::UrlFormatter.new

  context 'testing query string cases' do
    it 'should parse a url without filters' do
      spec = '/empleos-en-mexico-y-el-mundo/ruby'
      expect(formatter.format('ruby')).to eq(spec)
    end

    it 'should convert string to slug' do
      spec = '/empleos-en-mexico-y-el-mundo/ruby-on-rails'
      expect(formatter.format('ruby on rails')).to eq(spec)
    end

    it 'should convert string to slug NO CAPITALS' do
      spec = '/empleos-en-mexico-y-el-mundo/ruby-on-rails'
      expect(formatter.format('Ruby on Rails')).to eq(spec)
    end

    it 'should remove non alphabetical characters' do
      spec = '/empleos-en-mexico-y-el-mundo/ruby-on-rails-'
      expect(formatter.format('Ruby on rails %')).to eq(spec)
    end
  end

  context 'testing search options' do
    it 'should parse url for jalisco state :location => :jal' do
      search = 'Ruby on Rails'
      spec = '/empleos-en-jalisco/ruby-on-rails'
      expect(formatter.format(search, location: 'jal')).to eq(spec)
    end

    it 'passing a invalid location option should raise an ArgumentError' do
      search = 'Ruby on Rails'
      test = -> { formatter.format(search, location: 'jaliscolion') }
      expect(&test).to raise_error(ArgumentError)
    end

    it 'saraly should have a default behaiur' do
      search = 'Ruby on Rails'
      spec = '/empleos-en-mexico-y-el-mundo/ruby-on-rails'
      expect(formatter.format(search, salary: 'default')).to eq(spec)
    end

    it 'should be able to parse salary' do
      search = 'Ruby on Rails'
      spec = '/empleos-en-mexico-y-el-mundo/0-a-5000-pesos/ruby-on-rails'
      expect(formatter.format(search, salary: '0-5000')).to eq(spec)
    end

    it 'should raise an Argument error' do
      search = 'Ruby on Rails'
      test = -> { formatter.format(search, salary: '3000') }
      expect(&test).to raise_error(ArgumentError)
    end

    it 'should be able to parse since' do
      search = 'Ruby on Rails'
      spec = '/empleos-en-mexico-y-el-mundo/desde-hace-3-dias/ruby-on-rails'
      expect(formatter.format(search, days: 3)).to eq(spec)
    end

    it 'should accept a default option' do
      search = 'Ruby on Rails'
      spec = '/empleos-en-mexico-y-el-mundo/ruby-on-rails'
      expect(formatter.format(search, days: 'default')).to eq(spec)
    end

    it 'should raise an Argument error' do
      search = 'Ruby on Rails'
      test = -> { formatter.format(search, days: 5000) }
      expect(&test).to raise_error(ArgumentError)
    end

    it 'complex options case' do
      spec = '/empleos-en-jalisco/15000-a-20000-pesos/desde-hace-4-dias/'
      spec += 'web-developer'
      search = 'Web Developer'
      arguments = [search, location: 'jal', days: 4, salary: '15000-20000']
      expect(formatter.format(*arguments)).to eq(spec)
    end
  end
end
