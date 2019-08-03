require 'aws-sdk-ses'

module Aws
  module Ses
    module Mailer
      class DeliveryMethod
        attr_accessor :settings

        def initialize(options = {})
          self.settings = options
          self.ses = Aws::SES::Client.new(
            region: settings.fetch(:region, 'us-west-2')
          )
        end

        def deliver!(mail)
          options = { raw_message: {} }
          options[:destinations] = mail.destinations
          options[:raw_message][:data] = mail.to_s

          ses.send_raw_email(options)
        end

        private
        attr_accessor :ses
      end
    end
  end
end