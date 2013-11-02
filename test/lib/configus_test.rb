require "test_helper"

class ConfigusTest < TestCase
  def setup
    ENV['CONFIGUS'] = 'test'
    @configus = Configus.build do
      env :test do
        c 'c'
        a do
          b 'b'
        end
      end
    end
  end

  def test_configus
    assert_equal 'c', @configus.c
    assert_equal 'b', @configus.a.b
  end
end
