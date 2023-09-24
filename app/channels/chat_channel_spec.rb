# spec/channels/chat_channel_spec.rb

require 'rails_helper'

RSpec.describe ChatChannel, type: :channel do
  it 'subscribes to the chat channel' do
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_for('chat_channel')
  end

  it 'broadcasts a message' do
    subscribe
    expect {
      perform('send_message', message: 'Test message')
    }.to have_broadcasted_to('chat_channel').with(user: 'test@example.com', message: 'Test message')
  end
end
