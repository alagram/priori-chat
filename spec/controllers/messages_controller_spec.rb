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

  describe "POST create"  do

    it_behaves_like "authenticated user" do
      let(:action) { post :create }
    end

    context "with valid input" do

      let(:result) { double(:message_service, translate: "Ahoy, my friend") }

      before do
        session[:username] = "jack"
      end

      it "creates a message with yoda dialect" do
        session[:dialect] = "Yoda"
        allow_any_instance_of(DegreaveService).to receive(:translate).and_return(result)
        xhr :post, :create, message: { body:  "hello world"}
        expect(Message.count).to eq(1)
      end
      it "creates a message with pirate dialect" do
        session[:dialect] = "Pirate"
        allow_any_instance_of(HackDayService).to receive(:translate).and_return(result)
        xhr :post, :create, message: { body:  "hi my friend"}
        expect(Message.count).to eq(1)
      end
      it "creates a message with valley dialect" do
        session[:dialect] = "Valley Girl"
        allow_any_instance_of(DegreaveService).to receive(:translate).and_return(result)
        xhr :post, :create, message: { body:  "this is my test"}
        expect(Message.count).to eq(1)
      end
    end
    context "with invalid input" do

      let(:result) { double(:message_service, translate: "Ahoy, my friend") }

      before do
        session[:username] = "jane"
        session[:dialect] = "Valley Girl"
        allow_any_instance_of(HackDayService).to receive(:translate).and_return(result)
        xhr :post, :create, message: { body:  ""}
      end

      it "does not save the message" do
        expect(Message.count).to eq(0)
      end

      it "renders index template" do
        expect(response).to render_template :index
      end
    end
  end
end
