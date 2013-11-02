module Configus
  class Builder
    attr_reader :result

    def self.build(&block)
      builder = new(&block)
      builder.result
    end

    def initialize(&block)
      instance_eval &block
      @result
    end

    def env(env, &block)
      @result = Configus::ProxyBuilder.build(&block)
    end
  end
end
