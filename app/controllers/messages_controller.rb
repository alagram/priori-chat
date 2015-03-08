class MessagesController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    @messages = Message.all
  end

  def create
    user_dialect = session[:dialect].split.first.downcase
    message = params["message"]["body"]
    if session[:dialect] == "Pirate"
      result = HackDayService.new(message).translate
      @message = Message.create(message_params.merge!(author: current_user, "body" => "#{result}"))
    else
      result = DegreaveService.new(message, user_dialect).translate
      @message = Message.create(message_params.merge!(author: current_user, "body" => "#{result}"))
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
