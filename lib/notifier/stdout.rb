require 'lib/notifier/base'

module Notifier
  class Stdout < Notifier::Base
    private

    def format_message
      exchange = @data[:exchange]
      market = @data[:market]
      buy = @data[:pretty_buy]
      sell = @data[:pretty_sell]
      @output = ''
      @output << "#{market} on #{exchange}"
      @output << "\n"
      @output << "Buy: #{buy} Sell: #{sell}"
    end

    def notify
      puts @output
    end
  end
end
