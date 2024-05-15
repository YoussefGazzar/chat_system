require 'rails_helper'

RSpec.describe 'Chats', type: :request do
  before do
    @application = Application.create(name: 'App')
    @chat = @application.chats.create(number: 1)
  end

  describe 'GET /applications/:application_token/chats' do
    it 'returns all chats for an application' do
      get application_chats_path(@application.token)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /applications/:application_token/chats/:number' do
    it 'returns a single chat' do
      get application_chat_path(@application.token, @chat.number)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /applications/:application_token/chats' do
    it 'creates a new chat for an application' do
      expect(ChatCreatorJob).to receive(:perform_async).and_return(true)
      expect {
        post application_chats_path(@application.token)
      }.not_to change(Chat, :count)
      expect(response).to have_http_status(:created)
    end
  end
end
