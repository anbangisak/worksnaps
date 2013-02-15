# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'worksnaps/version'

Gem::Specification.new do |spec|
  #spec.add_dependency 'simple_oauth', '~> 0.2'
  spec.add_dependency 'active_support'
  spec.add_dependency 'crack'
  spec.add_dependency 'faraday'
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.authors = ["Chen ZhongXue"]
  spec.cert_chain  = ['certs/sferik.pem']
  spec.description = %q{A Ruby interface to the WorkSnaps API.}
  spec.email = ['xmpolaris@gmail.com']
  spec.files = %w(CHANGELOG.md CONTRIBUTING.md LICENSE.md README.md Rakefile worksnaps.gemspec)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.files += Dir.glob("spec/**/*")
  spec.homepage = 'https://github.com/xmpolaris/worksnaps'
  spec.licenses = ['MIT']
  spec.name = 'worksnaps'
  spec.require_paths = ['lib']
  spec.required_rubygems_version = '>= 1.1.0'
  spec.signing_key = File.expand_path("~/.gem/private_key.pem") if $0 =~ /gem\z/
  spec.summary = spec.description
  spec.test_files = Dir.glob("spec/**/*")
  spec.version = WorkSnaps::Version
end

