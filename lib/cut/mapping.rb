module Cut
  class Mapping

    attr_reader :name

    def initialize(name, options = {})
      @name = name
      @selector = options[:to]
    end

    def selector
      @selector ||= ".#{name}"
    end

  end
end
