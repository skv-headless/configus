module Configus
  class Builder
    attr_reader :result

    def initialize(&block)
      instance_eval &block
      @result
    end

    def env(env, &block)
      @result = Configus::ProxyBuilder.new(&block).hash
    end
  end
end
