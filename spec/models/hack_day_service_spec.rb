require 'rails_helper'

describe HackDayService do
  it "transforms the message when they are letters successfully", :vcr do
    message = "Hello my friend, do you know where I can get some shoes?"
    response = HackDayService.new(message).translate
    expect(response).to eq("Avast my mate, do you know where I can get some shoes?")
  end

  it "returns exact copy of string when they are digits", :vcr do
    message = "12345"
    response = HackDayService.new(message).translate
    expect(response).to eq(message)
  end

  it "returns blank string when message is blank", :vcr do
    message = ""
    response = HackDayService.new(message).translate
    expect(response).to be_empty
  end
end
