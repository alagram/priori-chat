require 'rails_helper'

describe SessionsController do
  describe "POST create" do
    context "with valid inputs" do
      before { post :create, username: "albert", dialect: "yoda" }

      it "sets username into the session" do
        expect(session[:username]).to eq("albert")
      end
      it "sets dialect into the session" do
        expect(session[:dialect]).to eq("yoda")
      end
      it "redirects to home path" do
        expect(response).to redirect_to home_path
      end
      it "sets flash success message" do
        expect(flash[:success]).to eq("Signed in.")
      end
    end

    context "with invalid inputs"
  end
end
