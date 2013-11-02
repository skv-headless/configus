require "configus/version"

module Configus
  # Your code goes here...
  autoload :Config, 'configus/config'
  autoload :Builder, 'configus/builder'
  autoload :ProxyBuilder, 'configus/proxy_builder'


  def self.build(&block)
    builder = Builder.new(&block)
    Config.new(builder.result)
  end
end
