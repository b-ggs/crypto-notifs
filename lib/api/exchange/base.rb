require 'lib/api/base'

module Api
  module Exchange
    class Base < Api::Base
      private

      def data
        {
          exchange: @exchange,
          market: "#{@product}-#{@currency}",
          product: @product,
          currency: @currency,
          buy: @buy,
          sell: @sell,
          pretty_buy: "#{@currency} #{@buy}",
          pretty_sell: "#{@currency} #{@sell}",
        }
      end
    end
  end
end
