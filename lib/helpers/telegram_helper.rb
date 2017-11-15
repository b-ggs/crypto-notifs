require 'telegram/bot'

module TelegramHelper
  def token
    ENV['TELEGRAM_BOT_TOKEN']
  end

  def chat_id
    ENV['TELEGRAM_CHAT_ID']
  end

  def send_message(bot, message)
    begin
      bot.api.send_message(
        chat_id: chat_id,
        text: message,
        parse_mode: 'Markdown',
      )
    rescue Telegram::Bot::Exceptions::ResponseError => e
      # TODO
      puts "Caught #{e}"
    rescue Exception => e
      # TODO
      puts "Caught #{e}"
    end
  end
end
