module Cut
  class Client

    def self.get(*args)
      new(*args).get
    end

    def initialize(endpoint, parameters = {})
      @endpoint = parameters.inject(endpoint) do |str, param|
        str.gsub("{{#{param.first}}}", CGI.escape(param.last))
      end
    end

    def get
      Response.new(HTTParty.get(endpoint))
    end

    private

    attr_reader :endpoint

  end
end
