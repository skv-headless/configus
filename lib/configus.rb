require "configus/version"

module Configus
  # Your code goes here...
  autoload :Config, 'configus/config'
  autoload :Builder, 'configus/builder'
  autoload :ProxyBuilder, 'configus/proxy_builder'


  def self.build(&block)
    builder = Builder.build(&block)
    Config.new(builder)
  end
end
