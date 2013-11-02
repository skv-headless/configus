module Configus
  class Config
    def initialize(hash)
      @hash = hash
    end

    def method_missing(method_name, *args, &block)
      raise "#{method_name} doesn't exist" unless @hash.has_key?(method_name)

      if @hash[method_name].kind_of? Hash
        self.class.new(@hash[method_name])
      else
        @hash[method_name]
      end
    end

    def respong_to_missing?(method_name, include_private = false)
      @hash.has_key?(method_name)
    end
  end
end
