require './lib/helpers/telegram_helper'
require './lib/helpers/pretty_message_helper'

class Notifier::Telegram < Notifier::Base
  include TelegramHelper
  include PrettyMessageHelper

  attr_accessor :message

  def format_message
    product = data[:product]
    exchange = data[:exchange]
    @message = ''
    @message << "#{attribute.capitalize} on #{product} is now `#{comparison_operator} #{threshold_value}` on #{exchange}!"
    @message << "\n"
    @message << code_block(data_summary(data))
  end

  def notify
    require 'telegram/bot'

    Telegram::Bot::Client.run(token) do |bot|
      send_message(bot, message)
    end
  end
end
