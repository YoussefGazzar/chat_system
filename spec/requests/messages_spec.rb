require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  before do
    @application = Application.create(name: 'App')
    @chat = @application.chats.create(number: 1)
    @message = @chat.messages.create(body: 'Hello', number: 1)
  end

  describe 'GET /applications/:application_token/chats/:chat_number/messages' do
    it 'returns all messages for a chat' do
      get application_chat_messages_path(@application.token, @chat.number)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /applications/:application_token/chats/:chat_number/messages/:number' do
    it 'returns a single message' do
      get application_chat_message_path(@application.token, @chat.number, @message.number)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /applications/:application_token/chats/:chat_number/messages' do
    it 'creates a new message for a chat' do
      expect(MessageCreatorJob).to receive(:perform_async).and_return(true)
      expect {
        post application_chat_messages_path(@application.token, @chat.number),
             params: { message: { body: 'New Message' } }
      }.not_to change(Message, :count)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /applications/:application_token/chats/:chat_number/messages/:number' do
    it 'updates a message' do
      put application_chat_message_path(@application.token, @chat.number, @message.number),
          params: { message: { body: 'Updated Message' } }
      expect(response).to have_http_status(:ok)
    end
  end
end
