require 'rake/clean'
require 'rubygems'
require 'rake/gempackagetask'
#require 'rubygems/package_task'  # MO
require 'rake/rdoctask'
#require 'rdoc/task'  # MO

# ? require 'bundler/gemtasks'

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc","lib/**/*.rb","bin/**/*")
  rd.title = 'Your application title'
end

# ??? File not found: lib

#require 'rake/rdoctask'
#Rake::RDocTask.new do |rdoc|
#  version = File.exist?('VERSION') ? File.read('VERSION') : ""
#
#  rdoc.rdoc_dir = 'rdoc'
#  rdoc.title = "PowerCSV #{version}"
#  rdoc.rdoc_files.include('README*')
#  rdoc.rdoc_files.include('lib/**/*.rb')
#end

spec = eval(File.read('powercsv.gemspec'))

Rake::GemPackageTask.new(spec) do |pkg|
end

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/tc_*.rb']
  #test.libs << 'lib' << 'test'
  #test.pattern = 'test/**/test_*.rb'
  #test.verbose = true
end

# MO: added :compile task
task :default => [:compile, :test]

# MO: add compile task provided by rake-compiler gem
require 'rake/extensiontask'
Rake::ExtensionTask.new('csv_parser')
