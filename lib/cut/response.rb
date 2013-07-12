module Cut
  class Response < Node

    def initialize(response)
      @response = response
    end

    private

    attr_reader :response

    def body
      response.body
    end

    def node
      @node ||= Nokogiri::HTML(body)
    end

  end
end
