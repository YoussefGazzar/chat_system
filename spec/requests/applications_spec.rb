require 'rails_helper'

RSpec.describe 'Applications', type: :request do
  before do
    @application = Application.create(name: 'App')
  end

  describe 'GET /applications' do
    it 'returns all applications' do
      get applications_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /applications/:token' do
    it 'returns a single application' do
      get application_path(@application.token)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /applications' do
    it 'creates a new application' do
      expect do
        post applications_path, params: { application: { name: 'New App' } }
      end.to change(Application, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /applications/:token' do
    it 'updates an application' do
      put application_path(@application.token), params: { application: { name: 'Updated App' } }
      expect(response).to have_http_status(:ok)
    end
  end
end
