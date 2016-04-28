# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'n_able_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "n_able_rails"
  spec.version       = NAbleRails::VERSION
  spec.authors       = ["Alex Myers"]
  spec.email         = ["dev.alex.myers@gmail.com"]
  spec.description   = "An Api wrapper for N-Able from SolarWinds"

  spec.summary       = %q{Ruby Wrapper for N-Able API}
  spec.homepage      = "https://github.com/enspiresoftware/n_able_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", '~> 1.11.2'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency      'savon', '~> 2.3'
  spec.add_runtime_dependency      'wasabi', '~> 3.2'
end
