require "configus/version"

module Configus
  # Your code goes here...
  autoload :Config, 'configus/config'
  autoload :Builder, 'configus/builder'


  def self.build(&block)
    builder = Builder.new(&block)
    Config.new(builder.hash)
  end
end
