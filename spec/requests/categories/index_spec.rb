require 'rails_helper'

RSpec.describe 'GET /api/v1/categories', type: :request do
  let(:url) { '/api/v1/categories' }
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }
  # let(:headers) { jwt_token(user.id.to_s) }

  context 'success response' do
    before { get url, params: {}, headers: {} }
    it 'returns categories' do
      expect(response).to have_http_status(:ok)
      expect(json).to eq('success' => true, 'categories' => [{ 'name' => category.name, 'user' => category.user }])
    end
  end
end
