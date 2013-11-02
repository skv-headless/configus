module Configus
  class Config
    attr_reader :hash

    def initialize(hash)
      @hash = hash
    end

    def method_missing(method_name, *args, &block)
      if @hash.has_key?(method_name)
        @hash[method_name]
      else
        raise "#{method_name} doesn't exist"
      end
    end

    def respong_to_missing?(method_name, include_private = false)
      @hash.has_key?(method_name)
    end
  end
end
