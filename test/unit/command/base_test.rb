require 'test_helper'
require 'rvm2/shell/command/base'

class Rvm2::Shell::Command::BaseTest < MiniTest::Unit::TestCase
  def setup
    @test = Rvm2::Shell::Command::Base
  end

  def test_true_to_s
    cmd = @test.new(:true)
    assert_equal cmd.to_s, "\"true\""
  end
end
