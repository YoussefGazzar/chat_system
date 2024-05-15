require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      application = Application.new(name: 'App')
      expect(application).to be_valid
    end

    it 'is not valid without a name' do
      application = Application.new(name: nil)
      expect(application).not_to be_valid
    end
  end

  describe '#generate_next_chat_number' do
    it 'increments next_chat_number' do
      application = Application.create(name: 'App')
      expect(application.generate_next_chat_number).to eq 1
      expect(application.next_chat_number).to eq 2
    end
  end
end
