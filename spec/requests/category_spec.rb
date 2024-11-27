require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/category/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/category/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/category/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/category/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
