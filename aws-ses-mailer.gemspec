$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'aws/ses/mailer/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'aws-ses-mailer'
  spec.version     = Aws::Ses::Mailer::VERSION
  spec.authors     = ['tabakazu']
  spec.email       = ['tkazz.bd1@gmail.com']
  spec.homepage    = 'https://github.com/tabakazu/aws-ses-mailer'
  spec.summary     = 'AWS SES Client for Action Mailer'
  spec.description = 'AWS SES Client for Action Mailer'
  spec.license     = 'MIT'
  spec.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']
  spec.add_dependency 'railties', '~> 5.0', '>= 5.0.0.1'
  spec.add_dependency 'aws-sdk-ses', '~> 1.6'
end
