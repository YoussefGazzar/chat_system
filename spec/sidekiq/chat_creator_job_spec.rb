require 'rails_helper'
RSpec.describe ChatCreatorJob, type: :job do
  let(:application) { Application.create(name: 'App') }

  it 'successfully creates a chat' do
    expect do
      ChatCreatorJob.new.perform(application.id, 1)
    end.to change(Chat, :count).by(1)
  end
end
