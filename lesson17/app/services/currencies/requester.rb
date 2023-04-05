module Currencies
  URL = 'https://www.freeforexapi.com'

  class Requester
    class ServiceUnavailable < StandardError; end

    def self.call(path:, params: {})
      request_url = Curl::urlalize(File.join(URL, path), params)
      response = Curl.get(request_url)

      if response.response_code == 200
        JSON(response.body)
      else
        raise ServiceUnavailable
      end
    end
  end
end
