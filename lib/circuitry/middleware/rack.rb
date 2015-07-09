require 'circuitry'
require 'rack/body_proxy'

module Circuitry
  module Middleware
    class Rack
      def initialize(app, options = {})
        @app = app
        Circuitry.config.publish_async_strategy = options.fetch(:publish_async_strategy, :batch)
        Circuitry.config.subscribe_async_strategy = options.fetch(:subscribe_async_strategy, :thread)
      end

      def call(env)
        status, headers, actual_body = @app.call(env)
        body = ::Rack::BodyProxy.new(actual_body) do
          Circuitry.flush
        end
        [status, headers, body]
      end
    end
  end
end
