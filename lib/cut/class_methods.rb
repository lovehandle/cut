module Cut
  module ClassMethods

    def url(new_url)
      @@url = new_url
    end

    def selector(new_selector)
      @@selector = new_selector
    end

    def map(*args)
      add_mapping(*args)
    end

    def all(options = {})
      endpoint = @@url.dup
      options.each {|key,value| endpoint.gsub!("{{#{key}}}", CGI.escape(value)) }
      response = Client.get(endpoint)

      parse(response)
    end

    private

    def mappings
      @@mappings ||= []
    end

    def add_mapping(name, type, options)
      mappings << Mapping.new(name, options)
      send(:attribute, name, type)
    end

    def parse(response)
      response.css(@@selector).map do |node|
        new.tap do |instance|
          mappings.each do |mapping|
            instance.send("#{mapping.name}=", node.at_css(mapping.selector).value)
          end
        end
      end
    end

  end
end
