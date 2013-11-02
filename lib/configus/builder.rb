module Configus
  class Builder
    def self.build(&block)
      instance_eval do
        def a
          1
        end
      end
      self
    end
  end
end
