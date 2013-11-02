module Configus
  class Builder
    def initialize(&block)
      instance_eval &block
    end
  end
end
