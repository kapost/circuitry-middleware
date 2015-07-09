# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'circuitry/middleware/version'

Gem::Specification.new do |spec|
  spec.name          = 'circuitry-middleware'
  spec.version       = Circuitry::Middleware::VERSION
  spec.authors       = ['Matt Huggins']
  spec.email         = ['matt.huggins@kapost.com']

  spec.summary       = %q{Rails/Rack middleware for batching circuitry notifications.}
  spec.description   = %q{Batches and flushes circuitry SNS messages after a request finishes processing.}
  spec.homepage      = 'https://github.com/kapost/circuitry-middleware'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'circuitry', '>= 1.1.0'
  spec.add_dependency 'rack', '>= 1.4.5'

  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
