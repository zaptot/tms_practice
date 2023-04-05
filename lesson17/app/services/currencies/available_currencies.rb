module Currencies
  class AvailableCurrencies
    AVAILABLE_CURRENCIES_PATH = '/api/live'
    CURRENCIES_KEY = 'supportedPairs'

    def self.call
      response_body = Requester.call(path: AVAILABLE_CURRENCIES_PATH)
      all_currencies_pairs = response_body[CURRENCIES_KEY]
      all_currencies_pairs.flat_map { |pair| [pair.first(3), pair.last(3)] }.uniq.sort
    end
  end
end
