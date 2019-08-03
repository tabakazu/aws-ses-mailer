module Aws
  module Ses
    module Mailer
      class Railtie < ::Rails::Railtie
        initializer 'aws-ses-mailer.add_delivery_method', before: :load_config_initializers do
          Aws::Ses::Mailer.add_options
        end
      end
    end
  end
end
