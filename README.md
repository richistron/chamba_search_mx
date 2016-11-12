# OCC MX Search

This gem allows you to perform searches by doing scrapping to occ.com.mx. It
provides links, sumarys, emails and userful information. This gem was created
for reaserch purpuses it only.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'occ_search'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install occ_search

## Usage

```ruby
jobs = OccSearch.find 'ruby developer', location: 'jal', days: 14, salary: '15000-20000'
jobs.each do |job|
  puts job.url
  puts job.title
  puts job.email
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/richistron/occ_search.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

