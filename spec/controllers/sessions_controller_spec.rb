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

    context "with invalid inputs" do
      it "redirects to root path if username is blank" do
        post :create, username: "", dialect: "yoda"
        expect(response).to redirect_to root_path
      end
      it "redirects to root path if dialect is blank" do
        post :create, username: "joe", dialect: ""
        expect(response).to redirect_to root_path
      end
      it "sets flash danger" do
        post :create, username: "", dialect: ""
        expect(flash[:danger]).to eq("Please check your inputs")
      end
    end
  end
end
