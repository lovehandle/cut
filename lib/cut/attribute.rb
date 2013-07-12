module Cut
  class Attribute

    DEFAULT_TYPE = String

    def initialize(name, options = {})
      @name = name
      @type = options[:type]
      @selector = options[:selector]
    end

    def type
      @type ||= DEFAULT_TYPE
    end

    def selector
      @selector ||= ".#{name}"
    end

    attr_reader :name

  end
end
