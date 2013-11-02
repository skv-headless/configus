require 'test_helper'

class BuilderTest < TestCase
  def setup
    @builder = Configus::Builder.new do
      c 'c'
      a do
        b 'b'
      end
    end
  end

  def test_simple
    assert_equal 'c', @builder.hash[:c]
  end

  def test_nested
    assert_equal 'b', @builder.hash[:a][:b]
  end
end
