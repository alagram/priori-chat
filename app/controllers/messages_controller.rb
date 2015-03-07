class MessagesController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    @messages = Message.all
  end

  def create
    @message = Message.create(params.require(:message).permit(:body).merge!(author: current_user))
  end
end
