module TelegramHelper
  def token
    ENV['TELEGRAM_BOT_TOKEN']
  end

  def chat_id
    ENV['TELEGRAM_CHAT_ID']
  end
end
