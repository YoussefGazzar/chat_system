require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    let(:application) { Application.create(name: 'App') }
    let(:chat) { application.chats.create}

    it 'is valid with valid attributes' do
      message = chat.messages.build(body: 'Hello', number: 1)
      expect(message).to be_valid
    end

    it 'is not valid without a body' do
      message = chat.messages.build(body: nil, number: 1)
      expect(message).not_to be_valid
    end
  end
end
