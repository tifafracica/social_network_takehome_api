# to make sure RSpec will run.
require 'rails_helper'

RSpec.describe Api::V1::SocialnetworksController do
  describe "GET #make_api_response" do
    before do
      get :make_api_response
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to contain_exactly('twitter', 'facebook', 'instagram')
    end
  end
end