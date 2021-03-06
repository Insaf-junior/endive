# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'endive/version'

Gem::Specification.new do |spec|
  spec.name          = "endive"
  spec.version       = Endive::VERSION
  spec.authors       = ["Insaf Gallyamov"]
  spec.email         = ["gallyamov.insaf@gmail.com"]
  spec.summary       = %q{Write a short summary. Required.}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'mustermann'
  spec.add_runtime_dependency 'jbuilder'
  spec.add_runtime_dependency 'reel'
  spec.add_runtime_dependency "minitest"
  spec.add_runtime_dependency 'uber'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end