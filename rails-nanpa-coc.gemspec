# frozen_string_literal: true

require_relative 'lib/nanpa/coc/version'

Gem::Specification.new do |spec|
  spec.name        = 'rails-nanpa-coc'
  spec.version     = NANPA::COC::VERSION
  spec.authors     = ['Joe Stein']
  spec.email       = ['joe@splitwise.com']
  spec.homepage    = 'https://github.com/jas14/rails-nanpa-coc'
  spec.summary     = 'Rails engine defining tasks and models for NANPA Central Office Code records.'
  spec.license     = 'MIT'
  spec.required_ruby_version = '~> 3.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_development_dependency 'rubocop', '~> 1.25'

  spec.add_dependency 'activerecord'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'bundler'
  spec.add_dependency 'railties', '>= 6.1.0'
end
