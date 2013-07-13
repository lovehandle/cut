module Cut
  module ClassMethods

    def url(new_url)
      @url = new_url
    end

    def selector(new_selector)
      @selector = new_selector
    end

    def map(*args)
      add_mapping(*args)
    end

    def all(options = {})
      Client.get(@url, options).css(@selector).map {|node| from_node(node) }
    end

    def first(options = {})
      from_node(Client.get(@url, options).at_css(@selector))
    end

    private

    def mappings
      @mappings ||= []
    end

    def add_mapping(name, type, options)
      mappings << Mapping.new(name, options)
      send(:attribute, name, type)
    end

    def from_node(node)
      new.tap do |instance|
        mappings.each do |mapping|
          instance.send("#{mapping.name}=", node.at_css(mapping.selector).value)
        end
      end
    end

  end
end
