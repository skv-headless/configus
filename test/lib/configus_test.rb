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
      env :production do
        a do
          b 'inheritance_b'
        end
      end

      env :development, parent: :production do
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
    assert_equal 'inheritance_b', @configus_inheritance.a.b
  end
end
