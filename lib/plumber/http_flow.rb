require 'net/http'

module Plumber
  class HttpFlow
    attr_accessor :data

    def initialize(url)
      @data = ""

      uri = URI.parse(url)
      req = Net::HTTP::Get.new(uri.path)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == "https")

      @data = http.request(req).body
    end
  end
end
