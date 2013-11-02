require 'bundler/setup'
Bundler.require

require 'minitest/autorun'
Minitest.autorun

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!
end

class TestCase < MiniTest::Test

end
