require 'test_helper'

class BuilderTest < TestCase
  def setup
    @builder = Configus::Builder.build :test do
      env :test do
        c 'c'
        a do
          b 'b'
        end
      end
    end
  end

  def test_simple
   assert_equal 'c', @builder[:c]
  end

  def test_nested
   assert_equal 'b', @builder[:a][:b]
  end
end
