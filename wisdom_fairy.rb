class WisdomFairy
  def self.get!
    quotes = [
      { "quote" => "Whenever you find yourself on the side of the majority, it is time to reform (or pause and reflect).", "author" => "Mark Twain" },
      { "quote" => "Anyone who thinks sitting in church can make you a Christian must also think that sitting in a garage can make you a car.", "author" => "Garrison Keillor" },
      { "quote" => "It is impossible to live without failing at something, unless you live so cautiously that you might as well not have lived at all - in which case, you fail by default.", "author" => "J.K. Rowling" }
    ]

    uri = URI.parse("http://quotes.rest/qod.json")
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    begin
      return Quote.new(JSON.parse(response.body)["contents"]["quotes"].first)
    rescue
      quote = quotes.sample
      return Quote.new(quote)
    end

  rescue Exception => e
    puts e.message
  end
end

