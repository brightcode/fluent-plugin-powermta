# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fluent-plugin-powermta/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Maarten Oelering"]
  gem.email         = ["maarten@brightcode.nl"]
  gem.description   = %q{Fluent input plugin for PowerMTA accounting logs}
  gem.summary       = %q{Fluent input plugin for PowerMTA accounting logs}
  gem.homepage      = "https://github.com/brightcode/fluent-plugin-powermta"

  gem.files         = `git ls-files`.split($\)
  #gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  #gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fluent-plugin-powermta"
  gem.require_paths = ["lib"]
  gem.version       = Fluent::Plugin::PowerMTA::VERSION

  gem.extensions    = ['ext/csv_parser/extconf.rb']
end

