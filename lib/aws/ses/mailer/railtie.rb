module Aws
  module Ses
    module Mailer
      class Railtie < ::Rails::Railtie
        initializer 'aws-ses-mailer.add_delivery_method', before: :load_config_initializers do
          Aws::Ses::Mailer.add_options
        end
      end

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
