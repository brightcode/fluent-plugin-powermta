# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__), 'lib/fluent-plugin-powermta', 'version.rb'])

# $:.push File.expand_path("../lib", __FILE__)
# require "fluent-plugin-powermta/version"

spec = Gem::Specification.new do |s| 
  s.name = 'fluent-plugin-powermta'
  s.version = Fluent::Plugin::PowerMTA::VERSION
  s.author = 'Maarte Oelering'
  s.email = 'maarten@brightcode.nl'
  s.homepage = 'http://github.com/brightcode'
  s.description = 'PowerMTA CSV processing'
  s.platform = Gem::Platform::RUBY
  s.summary = 'PowerMTA CSV processing'

# Add your other files here if you make them
  #s.files  = ['README.rdoc', 'Rakefile', 'powercsv.gemspec', 'powercsv.rdoc']
  #s.files += ['lib/powercsv.rb'] + Dir['lib/powercsv/**/*.rb']
  #s.files += Dir['ext/**/extconf.rb'] + Dir['ext/**/*.h'] + Dir['ext/**/*.c']
  #s.files += Dir['bin/pcsv']
  s.files         = `git ls-files`.split("\n")

  s.require_paths = ['lib']

  s.extensions = ['ext/csv_parser/extconf.rb']
  
  #s.has_rdoc = true
  #s.extra_rdoc_files = ['README.rdoc','powercsv.rdoc']
  #s.rdoc_options << '--title' << 'powercsv' << '--main' << 'README.rdoc'

  #s.bindir = 'bin'
  #s.executables << 'pcsv'
  #s.rubyforge_project = 'powercsv'
  s.add_development_dependency('rake')
  s.add_development_dependency('rake-compiler')
  s.add_development_dependency('rdoc')
end
