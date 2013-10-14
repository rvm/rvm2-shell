lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'rvm2/shell/version'
require 'yaml'

Gem::Specification.new do |spec|
  spec.name        = 'rvm2-shell'
  spec.version     = ::Rvm2::Shell::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Michal Papis']
  spec.email       = ['mpapis@gmail.com']
  spec.homepage    = 'https://github.com/rvm/rvm2-shell'
  spec.summary     =
  spec.description = 'SM Framework aka RVM 2 - Shell handling'
  spec.license     = 'Apache2'

  %w{hooks session net-ssh}.each do |name|
    spec.add_dependency(name)
  end

  %w{rake simplecov coveralls yard redcarpet}.each do |name|
    spec.add_development_dependency(name)
  end

  spec.files        = Dir.glob('lib/**/*.rb')
  spec.test_files   = Dir.glob('test/**/*.rb')
end
