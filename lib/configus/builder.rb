module Configus
  class Builder
    attr_reader :hash

    def initialize(&block)
      @hash = {}
      instance_eval &block
    end

    def method_missing(method_name, *args, &block)
      if block_given?
        @hash[method_name] = Configus::Builder.new(&block).hash
      else
        @hash[method_name] = args[0]
        @hash
      end
    end
  end
end
