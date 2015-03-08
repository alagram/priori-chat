module ApplicationHelper
  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block)}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

  def class_for(dialect)
    if dialect == "Pirate"
      'class="fa fa-flag"'
    elsif dialect == "Yoda"
      'class="fa fa-mars"'
    else
      'class="fa fa-venus"'
    end
  end
end
