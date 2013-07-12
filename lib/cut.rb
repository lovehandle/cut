require "httparty"
require "nokogiri"
require "virtus"

require "cut/version"
require "cut/class_methods"
require "cut/instance_methods"
require "cut/mapping"
require "cut/client"
require "cut/node"
require "cut/response"

module Cut

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
    base.send(:include, Virtus)
  end

end
