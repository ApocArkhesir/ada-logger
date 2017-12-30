require 'rubygems'
require 'mechanize'
require 'open-uri'

def get_value
  mechanize = Mechanize.new
  page = mechanize.get("https://coinmarketcap.com/currencies/cardano/")
  return page.at('div.container div.row div.col-lg-10 div.row.bottom-margin-1x div.col-xs-6.col-sm-8.col-md-4.text-left span#quote_price span.text-large2').text.strip
end

def log_message(value)
  t = Time.now.asctime
  return "Cardano (ADA) - $" + value + " - " + t + "\n"
end

def write_to_file(message)
  File.open("ada-log.txt", 'a+') {|f| f.puts(message)}
end

write_to_file(log_message(get_value))
