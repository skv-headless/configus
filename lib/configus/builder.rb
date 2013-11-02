module Configus
  class Builder
    attr_reader :result

    def self.build(&block)
      environment = ENV['CONFIGUS'] || 'test'
      builder = new(&block)
      builder.result[environment.to_sym]
    end

    def initialize(&block)
      @result = {}
      instance_eval &block
    end

    def env(env, &block)
      @result[env.to_sym] = Configus::ProxyBuilder.build(&block)
    end
  end
end
