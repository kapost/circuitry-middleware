module Circuitry
  class Middleware
    class Railtie < ::Rails::Railtie
      initializer 'circuitry.middleware' do |app|
        app.middleware.use Middleware
      end
    end
  end
end
