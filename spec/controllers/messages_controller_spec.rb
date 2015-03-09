require 'rails_helper'

describe MessagesController do
  describe "GET index" do

    it_behaves_like "authenticated user" do
      let(:action) { get :index }
    end

    context "authenticated users" do

      let(:message) { Fabricate(:message, body: "Hello world", dialect: "Pirate") }
      let(:online_user) { Fabricate(:online_user, username: "joe") }
      before { session[:username] = "joe" }

      it "sets the @message instance variable" do
        get :index
        expect(assigns(:message)).to be_instance_of(Message)
      end

      it "sets the @messages instance variable" do
        get :index
        expect(assigns(:message)).to be_instance_of(Message)
      end

      it "sets the @online_users instance vairable" do
        get :index
        expect(assigns(:online_users)).to eq([online_user])
      end
    end
  end
end
