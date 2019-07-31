module Aws
  module Ses
    module Mailer
      class Railtie < ::Rails::Railtie
        initializer 'aws-ses-mailer.add_delivery_method' do
          ActiveSupport.on_load :action_mailer do
            ActionMailer::Base.add_delivery_method(
              :aws_ses,
              Aws::Ses::Mailer::DeliveryMethod
            )
          end
        end
      end
    end
  end
end
