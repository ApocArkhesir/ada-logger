require 'net/http'
require 'json'

def parse
  url = 'https://api.coinmarketcap.com/v1/ticker/cardano/?convert=EUR'
  uri = URI(url)
  response = Net::HTTP.get(uri)
  parsed = JSON.parse(response)
  
  return parsed
end

def log_message(value)
  t = Time.now.asctime
  return "Cardano (ADA) cost $" + parse.first['price_usd'] + " as of " + t + 
    ". The price has changed " + parse.first['percent_change_1h'] + "% since last hour."
end

def write_to_file(message)
  File.open("ada-log.txt", 'a+') {|f| f.puts(message)}
end

write_to_file(log_message(parse))