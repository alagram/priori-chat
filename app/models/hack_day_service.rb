require 'net/http'
require 'open-uri'
require 'json'

class HackDayService
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def translate!
    text = URI::encode(message)
    uri = URI("http://isithackday.com/arrpi.php?text=#{text}&format=json")
    response = JSON.parse(Net::HTTP.get(uri))
    return response["translation"]["pirate"]
  end
end
