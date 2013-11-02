module Configus
  class Builder
    attr_reader :result

    def self.build(environment, &block)
      builder = new(&block)
      builder.result[environment]
    end

    def initialize(&block)
      @result = {}
      instance_eval &block
    end

    def env(environment, options = {}, &block)
      @result[environment.to_sym] = Configus::ProxyBuilder.build(&block)
      if options[:parent]
        @result[environment.to_sym].merge!(@result[options[:parent]])
      end
    end
  end
end
