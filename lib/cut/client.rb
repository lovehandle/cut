module Cut
  class Client

    def self.get(endpoint)
      new(endpoint).get
    end

    def initialize(endpoint)
      @endpoint = endpoint
    end

    def get
      Response.new(HTTParty.get(endpoint))
    end

    private

    attr_reader :endpoint

  end
end
