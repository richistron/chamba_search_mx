# Chamba Search MX

This gem allows you to find jobs in México.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chamba_search_mx'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chamba_search_mx

## Usage

```ruby
require 'chamba_search_mx'

jobs = ChambaSearchMx.find 'ruby developer'

jobs.each do |job|
  puts job.url
  puts job.title
  puts job.email
end
```

## Options

Locations

```
ags, bcn, bcs, cam, chi, chp, coa, col, default, df, dgo, gro, gto, hgo,
jal, mch, mex, mor, mx, nay, nl, oax, pue, qr, qro, sina, slp, sono, tab,
tam, tlx, us, ver, world, yuc, zac
```

Salaries
```
0-5000, 5000-10000, 10000-15000, 15000-20000, 20000-30000, 30000-40000,
40000-50000, 50000-65000, 65000-80000, 80000
```

Days
```
1, 2, 3, 4, 5, 6, 7, 14, 30, 60
```

Example
```ruby
options = {
  location: 'mx',
  days: 2,
  salary: '15000-20000'
}
ChambaSearchMx.find 'ruby developer', options
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/richistron/chamba_search_mx.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

