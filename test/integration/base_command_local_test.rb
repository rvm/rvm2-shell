require 'test_helper'
require 'rvm2/shell/command/base'
require 'rvm2/shell/runner/local'

class Rvm2::Shell::BaseCommandLocalTest < MiniTest::Unit::TestCase
  def setup
    @runner = Rvm2::Shell::Runner::Local.new
  end

  def test_execute_true
    @output_data = []
    @cmd = Rvm2::Shell::Command::Base.new(:true)
    @cmd.on_stdout{|o| @output_data << o}
    status = @cmd.execute(@runner)
    assert_equal @output_data*"", ""
    assert_equal status, 0
  end

  def test_execute_false
    @output_data = []
    @cmd = Rvm2::Shell::Command::Base.new("false")
    @cmd.on_stdout{|o| @output_data << o}
    status = @cmd.execute(@runner)
    assert_equal "", @output_data*""
    assert_equal 1, status
  end

  def test_execute_echo_test
    @output_data = []
    @cmd = Rvm2::Shell::Command::Base.new(:echo, "test")
    @cmd.on_stdout ->(){ |o| @output_data << o.strip }
    status = @cmd.execute(@runner)
    assert_equal "test", @output_data*""
    assert_equal 0, status
  end
end
