require 'test_helper'

class BuilderTest < TestCase
  def setup
    @builder = Configus::Builder.build do
      def a
        1
      end
    end
  end

  def test_first
    assert_equal 1, @builder.a
  end
end
