module Currencies
  class GetRate
    class BadParams < StandardError; end

    CURRENCIES_PATH = '/api/live'
    ALL_RATES_KEY = 'rates'
    RATE_KEY = 'rate'
    STATUS_KEY = 'code'
    MESSAGE_KEY = 'message'
    RATE_TTL = 5.seconds

    class << self
      def call(from:, to:)
        if current_db_rates_actual?(from: from, to: to)
          get_currency_rate_from_db(from: from, to: to)
        else
          rate = get_rate_from_api(from: from, to: to)
          save_rate_to_db(from: from, to: to, rate: rate)
        end.rate
      end

      private

      def current_db_rates_actual?(from:, to:)
        CurrencyRate.where(from: from, to: to).where('created_at > ?', RATE_TTL.ago).exists?
      end

      def get_currency_rate_from_db(from:, to:)
        CurrencyRate.where(from: from, to: to).order(created_at: :desc).first
      end

      def get_rate_from_api(from:, to:)
        needed_pair = [from, to].join
        body = Requester.call(path: CURRENCIES_PATH, params: { pairs: needed_pair })
        raise BadParams, body[MESSAGE_KEY] if body[STATUS_KEY].to_i != 200

        body.dig(ALL_RATES_KEY, needed_pair, RATE_KEY)
      end

      def save_rate_to_db(from:, to:, rate:)
        CurrencyRate.create(from: from, to: to, rate: rate)
      end
    end
  end
end
