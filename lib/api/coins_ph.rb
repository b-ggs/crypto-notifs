class Api::CoinsPh < Api::Base
  def initialize(options = {})
    @exchange = 'Coins.ph'
    @url = "https://quote.coins.ph/v1/markets/#{options[:product]}-#{options[:currency]}"
  end

  def parse_response
    @market = response['market']['symbol']
    @product = response['market']['product']
    @currency = response['market']['currency']
    @buy = response['market']['ask']
    @sell = response['market']['bid']
  end
end
