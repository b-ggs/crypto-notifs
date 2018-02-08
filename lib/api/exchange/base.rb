require 'lib/api/base'
require 'lib/helpers/amount_helper'

module Api
  module Exchange
    class Base < Api::Base
      include AmountHelper

      private

      def data
        {
          exchange: @exchange,
          market: "#{@product}-#{@currency}",
          product: @product,
          currency: @currency,
          buy: @buy,
          sell: @sell,
          pretty: {
            buy: pretty_fiat(@buy, @currency),
            sell: pretty_fiat(@sell, @currency)
          }
        }
      end
    end
  end
end
