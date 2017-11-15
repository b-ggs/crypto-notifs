require './lib/helpers/telegram_helper'
require './lib/helpers/pretty_message_helper'

class Listener::Telegram < Listener::Base
  include TelegramHelper
  include PrettyMessageHelper

  def listen
    require 'telegram/bot'

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          send_message(bot, "Subscribed!")
        when '/status'
          require './lib/api'
          options = {
            product: 'BTC',
            currency: 'PHP',
          }
          coins_ph_data = Api::CoinsPh.new(options).run
          send_message(bot, data_summary(coins_ph_data))
        when '/stop'
          # TODO
        end
      end
    end
  end
end
