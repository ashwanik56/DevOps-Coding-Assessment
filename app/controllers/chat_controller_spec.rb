# spec/controllers/chat_controller_spec.rb

require 'rails_helper'

RSpec.describe ChatController, type: :controller do
  describe 'POST #send_message' do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'creates a new chat message' do
      post :send_message, params: { message: 'Hello, world!' }
      expect(ChatMessage.count).to eq(1)
      expect(ChatMessage.last.content).to eq('Hello, world!')
    end

    it 'broadcasts the message' do
      post :send_message, params: { message: 'Hello, world!' }
      expect(response).to have_http_status(:ok)
    end
  end

  # Add more tests for other controller actions as needed
end
