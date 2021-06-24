lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date'
require 'bmt/version'

Gem::Specification.new do |spec|
  spec.name          = 'bmt'
  spec.version       = Bmt::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['Federico Tagliabue']
  spec.email         = ['federico.tagliabue@bugcrowd.com']
  spec.date          = Date.today.to_s
  spec.summary       = 'Ruby wrapper for Bugcrowd\'s Methodology Taxonomy'
  spec.homepage      = 'https://github.com/bugcrowd/vrt-ruby'
  spec.license       = 'MIT'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.6'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubocop', '0.56.0'

  spec.metadata = {
    'homepage_uri' => 'https://github.com/bugcrowd/bmt-ruby',
    'changelog_uri' => 'https://github.com/bugcrowd/bmt-ruby/blob/main/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/bugcrowd/bmt-ruby',
    'bug_tracker_uri' => 'https://github.com/bugcrowd/bmt-ruby/issues'
  }
end
