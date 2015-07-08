# Circuitry::Middleware

Rails/Rack middleware for batching circuitry notifications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'circuitry-middleware'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install circuitry-middleware

## Usage

### Ruby on Rails

If using this gem in the context of a Ruby on Rails application, there's nothing
more that you need to do beyond including the gem in your `Gemfile`.

If you do not have a `Gemfile` or you're explicitly setting `require: false`
within your `Gemfile`, then you'll need to require the gem within an
initializer:

```ruby
require 'circuitry-middleware'
```

### Rack

If using this gem in the context of a Rack application, you'll need to explicitly
include the middleware as a part of your Rackup file (generally `config.ru`):

```ruby
require 'circuitry-middleware'
use Circuitry::Middleware
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.  To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release` to create a git tag for the version, push git commits
and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/kapost/circuitry-middleware/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
