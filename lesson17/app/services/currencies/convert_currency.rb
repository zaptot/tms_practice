module Currencies
  class ConvertCurrency
    CONVERT_CURRENCIES_PATH = '/api/live'
    ALL_RATES_KEY = 'rates'
    RATE_KEY = 'rate'
    STATUS_KEY = 'code'
    MESSAGE_KEY = 'message'

    class << self
      def call(from:, to:, amount:)
        rate = get_rate(from, to)

        { from: from, to: to, amount_from: amount, amount_to: rate.to_f * amount.to_f }
      end

      private

      def get_rate(from, to)
        Rails.cache.fetch("currencies_pairs_rates/#{from}/#{to}", expires_in: 12.hours) do
          GetRate.call(from: from, to: to)
        end
      end
    end
  end
end
