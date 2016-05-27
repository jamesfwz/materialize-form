# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'materialize/form/version'

Gem::Specification.new do |spec|
  spec.name          = "materialize-form"
  spec.version       = Materialize::Form::VERSION
  spec.authors       = ["James La"]
  spec.email         = ["jamesla0604@gmail.com"]

  spec.summary       = "Materialize + SimpleForm."
  spec.description   = "This gem includes a generator for SimpleForm configuration with Materialize. It also includes custom inputs for materialize."
  spec.homepage      = "http://materialize-form.herokuapp.com/users/new"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", '~> 1.12', '>= 1.12.5'
  spec.add_development_dependency "rake", '~> 11.1', '>= 11.1.2'
end
