$LOAD_PATH << File.expand_path('..', __FILE__)

require 'dotenv/load'

options = {
  product: 'BTC',
  currency: 'PHP',
}

require 'lib/api/coins_ph'
coins_ph_data = Api::CoinsPh.new(options).run

require 'lib/api/coinbase'
coinbase_data = Api::Coinbase.new(options).run

# options = {
#   data: coins_ph_data,
#   attribute: 'buy',
#   comparison_operator: '<',
#   threshold_value: '330000',
#   skip_condition: true,
# }
# Notifier::Telegram.new(options).run

require 'lib/notifier/stdout'

options = {
  data: coins_ph_data,
  skip_condition: true,
}
Notifier::Stdout.new(options).run

options = {
  data: coinbase_data,
  skip_condition: true,
}
Notifier::Stdout.new(options).run
