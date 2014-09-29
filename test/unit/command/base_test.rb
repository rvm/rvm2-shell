require 'test_helper'
require 'rvm2/shell/command/executor'

class Rvm2::Shell::Command::ExecutorTest < MiniTest::Unit::TestCase
  def setup
    @test = Rvm2::Shell::Command::Executor
  end

  #~ def test_true_to_s
    #~ cmd = @test.new()
    #~ assert_equal cmd.to_s, "\"true\""
  #~ end
end
