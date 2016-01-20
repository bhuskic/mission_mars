# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mars_mission/version'

Gem::Specification.new do |gem|
  gem.name = 'mars_mission'
  gem.version = MarsMission::VERSION
  gem.platform = Gem::Platform::RUBY
  gem.authors = ['Boris Huskic']
  gem.email = ['bhuskic@gmail.com']
  gem.description = 'Mars rover navigation subroutine'
  gem.summary = 'Mars rover navigation subroutine'
  gem.homepage = 'http://github.com/bhuskic/mars_mission'

  gem.files = `git ls-files`.split($RS)
  gem.test_files = gem.files.grep(%r{^(test/spec/features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rspec',     '>= 3.0.0'
  gem.add_development_dependency 'bundler',   '>= 1.10.6'
  gem.add_development_dependency 'rake',      '>= 10.4.2'
end
