require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  describe "GET #like" do
    it "returns http success" do
      get :like
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #unlike" do
    it "returns http success" do
      get :unlike
      expect(response).to have_http_status(:success)
    end
  end

end
