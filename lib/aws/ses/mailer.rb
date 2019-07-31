module Aws
  module Ses
    module Mailer
      autoload :DeliveryMethod, 'aws/ses/mailer/delivery_method'
    end
  end
end

require 'aws/ses/mailer/railtie' if defined? Rails::Railtie