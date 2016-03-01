warn '[DEPRECATION] circuitry-middleware has been renamed to circuitry-rails and will no longer be supported. Please upgrade to circuitry-rails as soon as possible.'

require 'circuitry/middleware/version'
require 'circuitry/middleware/rack'
require 'circuitry/middleware/railtie' if defined?(Rails)
