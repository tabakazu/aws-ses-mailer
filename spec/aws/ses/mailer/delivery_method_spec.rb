require 'spec_helper'
require 'rails/railtie'
require 'action_mailer'

RSpec.describe Aws::Ses::Mailer::DeliveryMethod do
  let(:ses_stub_param) {{ stub_responses: { send_raw_email: { message_id: "1234567890" }}}}
  let(:mail_message) {
    ActionMailer::Base.mail(
      delivery_method: :aws_ses_mailer,
      to: 'to@example.org',
      from: 'from@example.org',
      subject: 'Test Mail Subject',
      body: 'Hi'
    )
  }
  before do
    ActionMailer::Base.add_delivery_method(:aws_ses_mailer, Aws::Ses::Mailer::DeliveryMethod, ses_stub_param)
  end

  it 'sends email' do
    mailer = Aws::Ses::Mailer::DeliveryMethod.new(ses_stub_param)
    response = mailer.deliver!(mail_message).to_h
    ses_message_id = ses_stub_param.dig(:stub_responses, :send_raw_email, :message_id)
    expect(response.dig(:message_id)).to eq ses_message_id
  end

  it 'sends email with action mailer' do
    response = mail_message.deliver!
    expect(response.error_status).to eq nil
  end
end
