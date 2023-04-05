module Currencies
  class ConvertCurrency
    CONVERT_CURRENCIES_PATH = '/api/live'
    ALL_RATES_KEY = 'rates'
    RATE_KEY = 'rate'
    STATUS_KEY = 'code'
    MESSAGE_KEY = 'message'

    def self.call(from:, to:, amount:)
      rate = GetRate.call(from: from, to: to)

      { from: from, to: to, amount_from: amount, amount_to: rate.to_f * amount.to_f}
    end
  end
end
