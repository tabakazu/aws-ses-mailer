# Aws::Ses::Mailer
AWS SES Client for Action Mailer

## Rails Setup
Add this line to your application's Gemfile:

```ruby
gem 'aws-ses-mailer'
```

Set the delivery method to config/environments/*.rb:

```ruby
config.action_mailer.delivery_method = :aws_ses
```