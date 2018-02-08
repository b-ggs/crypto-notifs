require 'pry'
require 'pry-byebug'
require 'lib/api/base'
require 'lib/helpers/amount_helper'

module Api
  module Others
    class BinanceFees < Api::Base
      include AmountHelper

      def initialize
        @url = 'https://www.binance.com/assetWithdraw/getAllAsset.html'
      end

      private

      def parse_response
        @fees = @response.map do |item|
          currency = item['assetCode']
          minimum_withdrawal = item['minProductWithdraw'].to_f
          transaction_fee = item['transactionFee'].to_f
          {
            currency: currency,
            minimum_withdrawal: minimum_withdrawal,
            transaction_fee: transaction_fee,
            pretty: {
              minimum_withdrawal: pretty_crypto(minimum_withdrawal, currency),
              transaction_fee: pretty_crypto(transaction_fee, currency)
            }
          }
        end
      end

      def data
        @fees
      end
    end
  end
end
