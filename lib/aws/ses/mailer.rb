module Aws
  module Ses
    module Mailer
      autoload :DeliveryMethod, 'aws/ses/mailer/delivery_method'

      class << self
        def add_options(options = { region: 'us-west-2' })
          ActiveSupport.on_load :action_mailer do
            ActionMailer::Base.add_delivery_method(
              :aws_ses_mailer,
              Aws::Ses::Mailer::DeliveryMethod,
              options
            )
          end
        end
      end
    end
  end
end

require 'aws/ses/mailer/railtie' if defined? Rails::Railtie