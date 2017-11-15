require 'dotenv/load'

require './lib/listener'

Listener::Telegram.new.listen
