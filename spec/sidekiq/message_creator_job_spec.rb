require 'rails_helper'
RSpec.describe MessageCreatorJob, type: :job do
  let(:application) { Application.create(name: 'App') }
  let(:chat) { application.chats.create(number: 1) }

  it 'successfully creates a message' do
    message_params = { body: 'Hello' }.to_json
    expect do
      MessageCreatorJob.new.perform(application.id, chat.id, message_params, 1)
    end.to change(Message, :count).by(1)
  end
end
