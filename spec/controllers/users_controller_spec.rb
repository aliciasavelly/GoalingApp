require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new users page" do
      get :new, user: {}
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of username and password" do

      end
    end

  context "with valid params" do
    it "redirects to the new users page" do

    end
  end
  end
end
