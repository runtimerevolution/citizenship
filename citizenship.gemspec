# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'citizenship/version'

Gem::Specification.new do |gem|
  gem.name          = "citizenship"
  gem.version       = Citizenship::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.authors       = ["Runtime Revolution"]
  gem.description   = %q{citizenship checks validity of civil id numbers and similar used in Portugal}
  gem.summary       = %q{citizenship checks validity of civil id numbers and similar used in Portugal}
  gem.homepage      = "https://github.com/runtimerevolution/citizenship"
  gem.email         = 'info@runtime-revolution.com'
  gem.license     = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'i18n', ['>= 0.6.4', '<= 0.7.0']

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", "~> 3.2.0"

  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'pry'
end
