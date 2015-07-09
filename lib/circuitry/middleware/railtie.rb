module Circuitry
  module Middleware
    class Railtie < ::Rails::Railtie
      initializer 'circuitry.middleware' do |app|
        app.middleware.use Middleware::Rack
      end
    end
  end
end
