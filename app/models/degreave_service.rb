include ActionView::Helpers::SanitizeHelper

class DegreaveService
  attr_reader :message, :dialect

  def initialize(message, dialect)
    @message = message
    @dialect = dialect
  end

  def translate
    encoded_message = URI::encode(message)
    uri = URI("http://www.degraeve.com/cgi-bin/babel.cgi?d=#{dialect}&url=&w=#{encoded_message}")
    response = strip_tags(Net::HTTP.get(uri))
    upcased_dialect = dialect.upcase
    format(response, upcased_dialect)
  end

  private

  def format(a_response, altered_dialect)
    message == "valley" ? a_response.gsub!("Crapola Translator\n\n\nuhoh, no header.\nTranslator : Your Words in #{altered_dialect}\n", "")
                     .gsub!("uhoh, no footer.", "") : a_response.gsub!("Crapola Translator\n\n\nuhoh, no header.\nTranslator : Your Words in #{altered_dialect}\n", "")
                     .gsub!("uhoh, no footer.", "").strip
  end
end
