module Cut
  class Node

    def initialize(node)
      @node = node
    end

    def css(selector)
      node.css(selector).map {|n| Node.new(n) }
    end

    def at_css(selector)
      Node.new(node.at_css(selector))
    end

    def value
      node.text
    end

    private

    attr_reader :node

  end
end
