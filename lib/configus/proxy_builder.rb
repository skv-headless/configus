module Configus
  class ProxyBuilder
    attr_reader :hash

    def self.build(&block)
      proxy = new(&block)
      proxy.hash
    end

    def initialize(&block)
      @hash = {}
      instance_eval &block
    end

    def method_missing(method_name, *args, &block)
      @hash[method_name] = block_given? ? Configus::ProxyBuilder.new(&block).hash : args[0]
    end
  end
end
