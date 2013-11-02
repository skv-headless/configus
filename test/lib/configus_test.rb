require "test_helper"

class ConfigusTest < TestCase
  def setup
    @configus = Configus.build do
      c 'c'
      a do
        b 'b'
      end
    end
  end

  def test_configus
    assert_equal 'c', @configus.c
    assert_equal 'b', @configus.a.b
  end
end
