# ada-logger
A Cardano (ADA) value logger written in Ruby. It gets the current Cardano price from the CoinMarketCap API and logs it to the file. 
It also displays the percental change in price since the last hour.

## How to use
The best way to use the logger is to execute the crontab command. First, edit the existing crontab or create a new one:
```
crontab -e
```

Then, simply add a new task. I would like the script to be executed every hour, so I'm going to write:
```
0 * * * * <path to my script> ; ruby ada-logger.rb
```