require 'rubygems'
require 'rake/rdoctask'
require 'rake/gempackagetask'

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Ruby Quiz #1: Solitaire Cipher"
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

gem_spec = eval(File.read('solitaire_cipher.gemspec'))

Rake::GemPackageTask.new(gem_spec) do |p|
  p.need_tar = false
  p.need_zip = false
end
