
## がんばルビィ
![がんばルビィ](https://raw.githubusercontent.com/aimerald/struby/master/images/do_your_rubesty.jpg?token=AHmiDaD_Kv_M-nkcmKKQTUH2vyeZdjaGks5bnR89wA%3D%3D)

# Struby

StrubyはStrava/API/v3というRubyGemにクラスを追加し便利にしたものです。これによりStravaAPIをRubyから簡単で直感的に利用できるようになっています。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'struby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install struby

## Usage

You need specify the ENV_VAR about `STRAVA_TOKEN`.

```
require 'struby'

athlete = Athlete.new

puts athlete.power_weight_ratio
# => 3.5

bike = athlete.bikes.first
puts bike.name
# => 'Tarmac SL6'

puts bike.distance
# => 196.34
puts bike.distance.to_mile
# => 122

clubs = athlete.clubs
puts clubs.first.name
# => 'I am Specialized'

activities = athlete.activities
# WIP
activities.growth(:power)
# => up to 3w!!!

activity = activities.first

puts activity.avg_cadence
# => 71

puts activity.max_power
# 460w

puts activity.distance
# => 196.34

puts activity.distance.to_mile
# => 122
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/struby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Struby project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/struby/blob/master/CODE_OF_CONDUCT.md).
