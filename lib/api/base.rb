require 'httparty'

class Api::Base
  attr_accessor :url, :response, :exchange, :product, :currency, :buy, :sell

  def run
    fetch
    parse_response
    data
  end

  def fetch
    begin
      fetch_from_url
    rescue HTTParty::Error => e
      puts "Caught #{e}"
      # TODO log me!
      exit 1
    rescue SocketError => e
      puts "No network #{e}"
      # TODO log me!
      exit 1
    end
  end

  def parse_response
    #
    # Override me to parse the response from your URL
    #   See sample at lib/api/coins_ph.rb
    #
  end

  def data
    {
      exchange: exchange,
      market: "#{product}-#{currency}",
      product: product,
      currency: currency,
      buy: buy,
      sell: sell,
      pretty_buy: "#{currency} #{buy}",
      pretty_sell: "#{currency} #{sell}",
    }
  end

  def fetch_from_url
    #
    # Override me if you need to call multiple API endpoints
    # This is so we can still override the fetch method without repeating the code to rescue exceptions
    #   See sample at lib/api/coinbase.rb
    #
    @response = HTTParty.get(url).parsed_response
  end
end
