require 'rails_helper'

RSpec.describe ChatsController, type: :routing do
  it 'routes to #index' do
    expect(get: '/applications/1/chats').to route_to('chats#index', application_token: '1')
  end

  it 'routes to #show' do
    expect(get: '/applications/1/chats/2').to route_to('chats#show', application_token: '1', number: '2')
  end

  it 'routes to #create' do
    expect(post: '/applications/1/chats').to route_to('chats#create', application_token: '1')
  end
end
