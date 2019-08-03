# Aws::Ses::Mailer
AWS SES Client for Action Mailer

## Rails Setup
Add this line to your application's Gemfile:

```ruby
gem 'aws-ses-mailer'
```

Set the delivery method to config/environments/*.rb:

```ruby
config.action_mailer.delivery_method = :aws_ses_mailer
```

Set the add options for aws setting to config/initializers/*.rb:

```ruby
Aws::Ses::Mailer.add_options({
  region: 'us-west-2'
})
```