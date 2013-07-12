# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cut/version'

Gem::Specification.new do |spec|
  spec.name          = "cut"
  spec.version       = Cut::VERSION
  spec.authors       = ["Ryan Closner"]
  spec.email         = ["ryan@ryanclosner.com"]
  spec.description   = %q{A Scraping DSL}
  spec.summary       = %q{A Scraping DSL}
  spec.homepage      = "http://github.com/rclosner/cut"
  spec.license       = "MIT"

  runtime_dependencies = {
    'httparty' => '~> 0.11.0',
    'nokogiri' => '~> 1.6.0',
    'virtus'   => '~> 0.5.5'
  }

  runtime_dependencies.each {|lib, version| spec.add_runtime_dependency(lib, version) }

  development_dependencies = {
    'bundler' => '~> 1.3',
    'rake' => '~> 10.1.0'
  }

  development_dependencies.each {|lib, version| spec.add_development_dependency(lib, version) }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
