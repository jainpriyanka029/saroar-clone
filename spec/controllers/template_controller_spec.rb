require 'rails_helper'

RSpec.describe TemplateController, type: :controller do

  describe "GET #estimate" do
    it "returns http success" do
      get :estimate
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #estimate_subworking" do
    it "returns http success" do
      get :estimate_subworking
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #estimate_subworking_specialist" do
    it "returns http success" do
      get :estimate_subworking_specialist
      expect(response).to have_http_status(:success)
    end
  end

end
