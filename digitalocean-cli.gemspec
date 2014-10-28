# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','digitalocean-cli','version.rb'])

spec = Gem::Specification.new do |s| 
  s.name = 'digitalocean-cli'
  s.version = DigitalOcean::VERSION
  s.author = 'Fabian M. Borschel'
  s.email = 'fmb@mailbox.org'
  s.homepage = 'http://github.com/onibox/digitalocean-cli'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A command line client for the DigitalOcean API'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  #s.extra_rdoc_files = ['README.rdoc','digitalocean-cli.rdoc']
  s.rdoc_options << '--title' << 'digitalocean-cli' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'digitalocean'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.12.2')
end
