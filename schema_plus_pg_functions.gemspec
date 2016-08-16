# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'schema_plus/pg_functions/version'

Gem::Specification.new do |gem|
  gem.name          = "schema_plus_pg_functions"
  gem.version       = SchemaPlus::PgFunctions::VERSION
  gem.authors       = ["mvgijssel"]
  gem.email         = ["maarten@hackerone.com"]
  gem.summary       = %q{TODO: Write a short summary. Required.}
  gem.description   = %q{TODO: Write a longer description. Optional.}
  gem.homepage      = "https://github.com/SchemaPlus/schema_plus_pg_functions"
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activerecord", "~> 4.2"
  gem.add_dependency "schema_plus_core", "~> 2.0"

  gem.add_development_dependency "bundler", "~> 1.7"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_development_dependency "rspec", "~> 3.0"
  gem.add_development_dependency "schema_dev", "~> 3.7"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "simplecov-gem-profile"
end
