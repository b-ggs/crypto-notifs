class Notifier::Telegram < Notifier::Base
  attr_accessor :message

  def format_message
    exchange = @data[:exchange]
    product = @data[:product]
    market = @data[:market]
    buy = @data[:pretty_buy]
    sell = @data[:pretty_sell]
    @message = ''
    @message << "#{attribute.capitalize} on #{product} is now `#{comparison_operator} #{threshold_value}` on #{exchange}!"
    @message << "\n"
    @message << '```'
    @message << "\n"
    @message << "#{market} on #{exchange}"
    @message << "\n"
    @message << "Buy: #{buy} Sell: #{sell}"
    @message << '```'
  end

  def notify
    send_message
  end

  private

  def send_message
    require 'telegram/bot'

    token = ENV['TELEGRAM_BOT_TOKEN']
    chat_id = ENV['TELEGRAM_CHAT_ID']
    begin
      Telegram::Bot::Client.run(token) do |bot|
        bot.api.send_message(
          chat_id: chat_id,
          text: message,
          parse_mode: 'Markdown',
        )
      end
    rescue Telegram::Bot::Exceptions::ResponseError => e
      # TODO
      puts "Caught #{e}"
    rescue Exception => e
      # TODO
      puts "Caught #{e}"
    end
  end
end
