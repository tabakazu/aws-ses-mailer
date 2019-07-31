require 'aws-sdk-ses'

module Aws
  module Ses
    module Mailer
      class DeliveryMethod
        attr_accessor :settings

        def initialize(options = {})
          self.settings = options
        end

        def deliver!(mail)
          message = mail.is_a?(Hash) ? Mail.new(mail) : mail

          request_data = {
            destination: {},
            message: {
              body: {}
            },
            source: {},
          }

          html_data = message.body.parts.find { |part| part.content_type == 'text/html; charset=UTF-8' }.body.raw_source
          text_data = message.body.parts.find { |part| part.content_type == 'text/plain; charset=UTF-8' }.body.raw_source

          request_data[:destination].store(:to_addresses, message.to) if message.to
          request_data[:message][:body].store(:text, { charset: 'UTF-8', data: text_data,}) if text_data
          request_data[:message].store(:subject, { charset: 'UTF-8', data: message.subject,}) if message.subject
          request_data[:source] = message.from.first if message.from.present?

          ses = Aws::SES::Client.new(
            region: settings.fetch(:region, 'us-west-2')
          )

          response = ses.send_email(request_data)
        end
      end
    end
  end
end