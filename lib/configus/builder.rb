module Configus
  class Builder
    attr_reader :result, :parent_envs

    def self.build(environment, &block)
      builder = new(&block)
      parent_env = builder.parent_envs.fetch(environment, false)
      if parent_env
        builder.result[environment].merge(builder.result[parent_env])
      else
        builder.result[environment]
      end
    end

    def initialize(&block)
      @result = {}
      @parent_envs = {}
      instance_eval &block
    end

    def env(environment, options = {}, &block)
      @result[environment.to_sym] = Configus::ProxyBuilder.build(&block)
      @parent_envs[environment.to_sym] = options[:parent]
    end
  end
end
