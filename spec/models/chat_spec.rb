require 'rails_helper'

RSpec.describe Chat, type: :model do
  describe 'validations' do
    let(:application) { Application.create(name: 'App') }

    it 'is valid with a valid number' do
      chat = application.chats.build(number: 1)
      expect(chat).to be_valid
    end

    it 'is not valid with a duplicate number' do
      chat1 = application.chats.create
      chat2 = application.chats.build(number: chat1.number)
      expect(chat2).not_to be_valid
    end
  end

  describe '#generate_next_message_number' do
    it 'increments next_message_number' do
      application = Application.create(name: 'App')
      chat = application.chats.create(number: 1)
      expect(chat.generate_next_message_number).to eq 1
      expect(chat.next_message_number).to eq 2
    end
  end
end
