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
      @response = HTTParty.get(url).parsed_response
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
end
