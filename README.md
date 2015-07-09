# Circuitry::Middleware

Rails/Rack middleware for batching circuitry notifications.

[![Code Climate](https://codeclimate.com/repos/559d735f6956804ff2000a9b/badges/ab8b6ef0a8e8a115041b/gpa.svg)](https://codeclimate.com/repos/559d735f6956804ff2000a9b/feed)
[![Test Coverage](https://codeclimate.com/repos/559d735f6956804ff2000a9b/badges/ab8b6ef0a8e8a115041b/coverage.svg)](https://codeclimate.com/repos/559d735f6956804ff2000a9b/coverage)

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

### Ruby on Rails 4.x

If using this gem in the context of a Ruby on Rails application, there's nothing
more that you need to do beyond including the gem in your `Gemfile`.

If you do not have a `Gemfile` or you're explicitly setting `require: false`
within your `Gemfile`, then you'll need to require the gem within an
initializer:

```ruby
require 'circuitry-middleware'
```

### Ruby on Rails 3.x

If your application *does not* use either of the `Rack::ETag` or
`Rack::ConditionalGet` middleware components (check via `rake middleware`), then
you can follow the Rails 4.x directions above.

If your application *does* use either of these middleware components, then this
gem must be implemented in a different manner due to an older Rack dependency
that improperly implements these pieces of middleware.

First, in your `Gemfile`:

```ruby
gem 'circuitry-middleware', require: false
```

Then in your `config/application.rb`:

```ruby
require 'circuitry/middleware/rack'
config.middleware.insert_before Rack::ConditionalGet, Circuitry::Middleware::Rack
```

### Rack

If using this gem in the context of a Rack application, you'll need to explicitly
include the middleware as a part of your Rackup file (generally `config.ru`):

```ruby
require 'circuitry-middleware'
use Circuitry::Middleware
```

### Custom Options

By default, this gem utilizes batching when publishing and threading when
subscribing.  These options can be overridden by swapping the middleware.

```ruby
config.middleware.swap Circuitry::Middleware::Rack, Circuitry::Middleware::Rack,
    publish_async_strategy: :fork,
    subscribe_async_strategy: :fork
```

Please refer to the [circuitry gem](https://github.com/kapost/circuitry) for
more insight on asynchronous options.

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
