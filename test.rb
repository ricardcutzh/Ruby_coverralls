require 'coveralls'
Coveralls.wear!
require 'simplecov'
require 'simplecov-lcov'
require 'test-unit'

SimpleCov::Formatter::LcovFormatter.config do |c|
    c.report_with_single_file = true
    c.single_report_path = 'coverage/lcov.info'
end
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::LcovFormatter,
    Coveralls::SimpleCov::Formatter
  ]
)
SimpleCov.command_name 'test:units'
SimpleCov.start 'rails'

require_relative 'example.rb'

class TestCoverage < Test::Unit::TestCase
    def test_one
        assert_equal(34, return_value(34))
    end

    def test_two
        assert_equal(35, return_value_new(35))
    end
end