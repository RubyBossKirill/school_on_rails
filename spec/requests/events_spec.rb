require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/events/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/events/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/events/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/events/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /delete' do
    it 'returns http success' do
      get '/events/delete'
      expect(response).to have_http_status(:success)
    end
  end
end
