require 'dotenv/load'

require './lib/api'

options = {
  product: 'BTC',
  currency: 'PHP',
}
coins_ph_data = Api::CoinsPh.new(options).run
coinbase_data = Api::Coinbase.new(options).run

# options = {
#   data: coins_ph_data,
#   attribute: 'buy',
#   comparison_operator: '<',
#   threshold_value: '330000',
#   skip_condition: true,
# }
# Notifier::Telegram.new(options).run

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
