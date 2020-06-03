require 'simplecov'
require 'simplecov-lcov'
require 'coveralls'
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
Coveralls.wear!

require_relative 'example.rb'

class TestCoverage < Test::Unit::TestCase
    def test_one
        assert_equal(34, return_value(34))
    end
end