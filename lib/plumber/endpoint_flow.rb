module Plumber
  class EndpointFlow
    attr_accessor :data

    def initialize(data_source)
      endpoint = Endpoint.find(data_source)
      @data = endpoint.data
    end
  end
end
