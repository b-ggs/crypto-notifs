$LOAD_PATH << File.expand_path('..', __FILE__)

require 'dotenv/load'

options = {
  product: 'BTC',
  currency: 'PHP',
}

require 'lib/api/coins_ph'
coins_ph_data = Api::CoinsPh.new(options).run

puts coins_ph_data

require 'lib/api/coinbase'
coinbase_data = Api::Coinbase.new(options).run

puts coinbase_data
