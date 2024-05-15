require 'rails_helper'

RSpec.describe ApplicationsController, type: :routing do
  it 'routes to #index' do
    expect(get: '/applications').to route_to('applications#index')
  end

  it 'routes to #show' do
    expect(get: '/applications/1').to route_to('applications#show', token: '1')
  end

  it 'routes to #create' do
    expect(post: '/applications').to route_to('applications#create')
  end

  it 'routes to #update' do
    expect(put: '/applications/1').to route_to('applications#update', token: '1')
  end
end
