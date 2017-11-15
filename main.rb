require 'dotenv/load'

require './lib/api'
require './lib/notifier'

options = {
  product: 'BTC',
  currency: 'PHP',
}
coins_ph_data = Api::CoinsPh.new(options).run

options = {
  data: coins_ph_data,
  attribute: 'buy',
  comparison_operator: '<',
  threshold_value: '330000',
}
Notifier::Telegram.new(options).run

options = {
  data: coins_ph_data,
}
Notifier::Stdout.new(options).run
