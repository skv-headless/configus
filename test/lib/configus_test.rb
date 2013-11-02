require "test_helper"

class ConfigusTest < TestCase
  def setup
    @configus = Configus.build :test do
      env :test do
        c 'c'
        a do
          b 'b'
        end
      end
    end

    @configus_inheritance = Configus.build :development do
      env :development do
        c 'development_c'
      end

      env :test do
        c 'c'
      end
    end
  end

  def test_configus
    assert_equal 'c', @configus.c
    assert_equal 'b', @configus.a.b
  end

  def test_inheritance
    assert_equal 'development_c', @configus_inheritance.c
  end
end
