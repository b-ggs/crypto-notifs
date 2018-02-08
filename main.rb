$LOAD_PATH << File.expand_path('..', __FILE__)

require 'dotenv/load'

require 'lib/api/exchange/coins_ph'
require 'lib/api/exchange/coinbase'

options = {
  product: 'BTC',
  currency: 'PHP',
}
coins_ph_data = Api::Exchange::CoinsPh.new(options).run
puts coins_ph_data

coinbase_data = Api::Exchange::Coinbase.new(options).run
puts coinbase_data

# require 'lib/api/base'
#
# options = {
#   url: 'https://www.binance.com/assetWithdraw/getAllAsset.html'
# }
# binance_fees_data = Api::Base.new(options).run
# puts binance_fees_data

require 'lib/api/others/binance_fees'

binance_fees_data = Api::Others::BinanceFees.new.run
puts binance_fees_data
