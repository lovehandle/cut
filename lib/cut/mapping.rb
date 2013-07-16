module Cut
  class Mapping

    attr_reader :name

    def initialize(name, options = {})
      @name      = name
      @selector  = options[:to]
      @operation = options[:operation]
    end

    def selector
      @selector ||= ".#{name}"
    end

    def operation
      @operation ||= Proc.new {|value| value }
    end

    def value_from_node(node)
      operation.call( node.at_css(selector).value.to_s )
    end

  end
end
