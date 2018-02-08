require 'lib/api/base'

module Api
  class Coinbase < Api::Base
    attr_accessor :buy_url, :sell_url

    def initialize(options = {})
      @exchange = 'Coinbase'
      product = options[:product]
      currency = options[:currency]
      base_url = "https://api.coinbase.com/v2/prices/#{product}-#{currency}/"
      @buy_url = base_url + 'buy'
      @sell_url = base_url + 'sell'
    end

    private

    def parse_response
      buy_data = response[:buy]['data']
      sell_data = response[:sell]['data']
      @product = buy_data['base']
      @currency = buy_data['currency']
      @buy = buy_data['amount']
      @sell = sell_data['amount']
    end

    def fetch_from_url
      buy_response = HTTParty.get(buy_url).parsed_response
      sell_response = HTTParty.get(sell_url).parsed_response
      @response = {
        buy: buy_response,
        sell: sell_response,
      }
    end
  end
end
