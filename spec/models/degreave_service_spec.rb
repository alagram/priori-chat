require 'rails_helper'

describe DegreaveService do
  it "translates message successfully when dialect is valley", :vcr do
    message = "This thing is fun and exciting"
    dialect = "valley"
    response = DegreaveService.new(message, dialect).translate
    expect(response).to eq("This thing is like totally fun and exciting")
  end
  it "translates message successfully when dialect is yoda", :vcr do
    message = "This thing is fun and exciting"
    dialect = "yoda"
    response = DegreaveService.new(message, dialect).translate
    expect(response).to eq(" Fun and exciting, this thing is ")
  end
end
