require 'spec_helper'
require 'action_mailer'

RSpec.describe Aws::Ses::Mailer do
  it 'exists aws_ses_mailer in delivery methods' do
    methods = ActionMailer::Base.delivery_methods
    expect(methods.key?(:aws_ses_mailer)).to eq true
  end
end
