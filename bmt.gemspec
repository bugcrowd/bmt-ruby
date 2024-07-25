lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date'
require 'bmt/version'

Gem::Specification.new do |spec|
  spec.name          = 'bmt'
  spec.version       = Bmt::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['Federico Tagliabue', 'Andy White']
  spec.email         = ['federico.tagliabue@bugcrowd.com', 'arcwhite@arcwhite.org']
  spec.summary       = 'Ruby wrapper for Bugcrowd\'s Methodology Taxonomy'
  spec.homepage      = 'https://github.com/bugcrowd/bmt-ruby'
  spec.license       = 'MIT'
  spec.files         = Dir['lib/**/*.{rb,json}']
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 3.1'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubocop', '1.65'

  spec.metadata = {
    'homepage_uri' => 'https://github.com/bugcrowd/bmt-ruby',
    'changelog_uri' => 'https://github.com/bugcrowd/bmt-ruby/blob/main/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/bugcrowd/bmt-ruby',
    'bug_tracker_uri' => 'https://github.com/bugcrowd/bmt-ruby/issues',
    'rubygems_mfa_required' => 'true'
  }
end
