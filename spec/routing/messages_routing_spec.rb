require 'rails_helper'

RSpec.describe MessagesController, type: :routing do
  it 'routes to #index' do
    expect(get: '/applications/1/chats/2/messages').to route_to('messages#index', application_token: '1', chat_number: '2')
  end

  it 'routes to #show' do
    expect(get: '/applications/1/chats/2/messages/3').to route_to('messages#show', application_token: '1', chat_number: '2', number: '3')
  end

  it 'routes to #create' do
    expect(post: '/applications/1/chats/2/messages').to route_to('messages#create', application_token: '1', chat_number: '2')
  end

  it 'routes to #update' do
    expect(get: '/applications/1/chats/2/messages/3').to route_to('messages#show', application_token: '1', chat_number: '2', number: '3')
  end
end
