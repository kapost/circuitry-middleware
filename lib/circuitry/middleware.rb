require 'circuitry/middleware/version'
require 'circuitry/middleware/railtie' if defined?(Rails)
require 'circuitry'

module Circuitry
  class Middleware
    def initialize(app, options = {})
      @app = app
      Circuitry.config.publish_async_strategy = options.fetch(:publish_async_strategy, :batch)
      Circuitry.config.subscribe_async_strategy = options.fetch(:subscribe_async_strategy, :thread)
    end

    def call(env)
      @app.call(env)
      Circuitry.flush
    end
  end
end
