module Cut
  module ClassMethods

    def url(new_url)
      @@url = new_url
    end

    def selector(new_selector)
      @@selector = new_selector
    end

    def attribute(attr_name, options = {})
      attributes << Attribute.new(attr_name, options)
    end

    def all(options = {})
      endpoint = @@url.dup
      options.each {|key,value| endpoint.gsub!("{{#{key}}}", CGI.escape(value)) }
      response = Client.get(endpoint)

      parse(response)
    end

    private

    def attributes
      @@attributes ||= []
    end

    def parse(response)
      response.css(@@selector).map do |node|
        new.tap do |instance|
          attributes.each do |attr|
            instance.send("#{attr.name}=", typecast(node.at_css(attr.selector).value, attr.type))
          end
        end
      end
    end

    # TODO: IMPLEMENT ME
    def typecast(value, type)
      value.to_s
    end

  end
end
