require 'test_helper'

class Rvm2::Shell::Runner
end

require 'rvm2/shell/runner/fake'

class TestCommentTestInput < MiniTest::Unit::TestCase
  def setup
    @test = Rvm2::Shell::Runner::Fake
  end

  def test_true
    test_command = "echo test"
    fake = @test.new
    fake.respond do |command|
      assert_equal command, test_command
      [0,[]]
    end
    called = 0
    status =
    fake.execute(test_command) do |out, err|
      called+=1
    end
    assert_equal called, 0
    assert_equal status, 0
  end

  def test_echo_test
    test_command = "echo test"
    fake = @test.new
    fake.respond do |command|
      assert_equal command, test_command
      [0,[['test',nil]]]
    end
    called = 0
    status =
    fake.execute(test_command) do |out, err|
      assert_equal out, "test"
      assert_equal err, nil
      called+=1
    end
    assert_equal called, 1
    assert_equal status, 0
  end
end
