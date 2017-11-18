class Api::CoinsPh < Api::Base
  def initialize(options = {})
    @exchange = 'Coins.ph'
    product = options[:product]
    currency = options[:currency]
    @url = "https://quote.coins.ph/v1/markets/#{product}-#{currency}"
  end

  def parse_response
    @product = response['market']['product']
    @currency = response['market']['currency']
    @buy = response['market']['ask']
    @sell = response['market']['bid']
  end
end
