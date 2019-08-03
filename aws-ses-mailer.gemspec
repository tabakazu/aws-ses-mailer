$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'aws/ses/mailer/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'aws-ses-mailer'
  spec.version     = Aws::Ses::Mailer::VERSION
  spec.authors     = ['Kazuma Taba']
  spec.email       = ['tkazz.bd1@gmail.com']
  spec.homepage    = 'https://github.com/tabakazu/aws-ses-mailer'
  spec.summary     = 'AWS SES Client for Action Mailer'
  spec.description = 'AWS SES Client for Action Mailer'
  spec.license     = 'MIT'
  spec.files       = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  spec.add_dependency 'aws-sdk-ses', '~> 1.6'
  spec.add_development_dependency 'rails', '~> 5.2.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
end
