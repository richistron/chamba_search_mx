require "spec_helper"

describe OccSearch::UrlFormatter do
  formatter = OccSearch::UrlFormatter.new

  context 'testing query string cases' do
    it 'should parse a url without filters' do
      expect(formatter.format('ruby')).to eq('/empleos-en-mexico-y-el-mundo/ruby')
    end

    it 'should convert string to slug' do
      expect(formatter.format('ruby on rails')).to eq('/empleos-en-mexico-y-el-mundo/ruby-on-rails')
    end

    it 'should convert string to slug NO CAPITALS' do
      expect(formatter.format('Ruby on Rails')).to eq('/empleos-en-mexico-y-el-mundo/ruby-on-rails')
    end

    it 'should remove non alphabetical characters' do
      expect(formatter.format('Ruby on rails %')).to eq('/empleos-en-mexico-y-el-mundo/ruby-on-rails-')
    end
  end

  context 'testing search options' do
    it 'should parse url for jalisco state :location => :jal' do
      search = 'Ruby on Rails'
      spec = '/empleos-en-jalisco/ruby-on-rails'
      expect(formatter.format(search, :location => :jal )).to eq(spec)
    end

    it 'passing a invalid location option should raise an ArgumentError' do
      search = 'Ruby on Rails'
      spec = '/empleos-en-jalisco/ruby-on-rails'
      expect{ formatter.format(search, :location => :jaliscolion ) }.to raise_error(ArgumentError)
    end

    # it 'should be able to parse salary' do
      # search = 'Ruby on Rails'
      # spec = '/5000-10000-pesos/ruby-on-rails'
      # expect{ formatter.format(search, :salary => :from5000to10000 ) }.to raise_error(ArgumentError)
    # end
  end
end
