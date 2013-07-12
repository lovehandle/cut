require "httparty"
require "nokogiri"

require "cut/version"
require "cut/class_methods"
require "cut/instance_methods"
require "cut/attribute"
require "cut/client"
require "cut/node"
require "cut/response"

module Cut

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end

end
