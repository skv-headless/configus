require 'test_helper'

class ConfigTest < TestCase

  def setup
    @hash = {h: 1}
    @config = Configus::Config.new(@hash)
  end

  def test_key_value
    assert_equal @hash[:h], @config.h
  end
end
