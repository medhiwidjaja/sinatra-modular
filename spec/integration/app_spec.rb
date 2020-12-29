require_relative "../spec_helper"
require_relative "../../app"

describe "app" do
  let!(:app) { App.new }
  let(:app_name) { App.settings.app_name }

  describe "GET '/'" do
    it "says welcome" do
      get "/"

      expect(last_response).to be_ok
      expect(last_response.body).to include("Welcome to #{app_name}")
    end
  end

  describe "API endpoints" do
    it "returns JSON" do
      get "/api/v1/info"

      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to eq({"app_name" => app_name})
    end
  end
end
