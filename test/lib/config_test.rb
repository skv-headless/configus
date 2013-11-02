require 'test_helper'

class ConfigTest < TestCase

  def setup
    @hash = {a: 1, b: {c: 3}}
    @config = Configus::Config.new(@hash)
  end

  def test_key_value
    assert_equal @hash[:a], @config.a
  end

  def test_nested_values
    assert_equal @hash[:b][:c], @config.b.c
  end
end
