require 'rails_helper'

RSpec.describe "UserFavorites", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/user_favorites/show"
      expect(response).to have_http_status(:success)
    end
  end

end
