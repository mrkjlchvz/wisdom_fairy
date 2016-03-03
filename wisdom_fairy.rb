class WisdomFairy
  def self.get!
    uri = URI.parse("http://quotes.rest/qod.json")
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))

    Quote.new(JSON.parse(response.body)["contents"]["quotes"].first)

  rescue Exception => e
    puts e.message
  end
end