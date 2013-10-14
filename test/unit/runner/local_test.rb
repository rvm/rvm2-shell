require 'test_helper'

class Rvm2::Shell::Runner
end

require 'rvm2/shell/runner/local'

class Rvm2::Shell::Runner::TestLocal < MiniTest::Unit::TestCase
  def setup
    @test = Rvm2::Shell::Runner::Local
  end

  def test_true
    test_command = "true"
    local = @test.new
    called = 0
    status =
    local.execute(test_command) do |out, err|
      called+=1
    end
    assert_equal 0, called
    assert_equal 0, status
  end

  def test_false
    test_command = "false"
    local = @test.new
    called = 0
    status =
    local.execute(test_command) do |out, err|
      called+=1
    end
    assert_equal 0, called
    assert_equal 1, status
  end

  def test_echo_test
    test_command = "echo test"
    local = @test.new
    called = 0
    status =
    local.execute(test_command) do |out, err|
      assert_equal out, "test\n"
      assert_equal err, nil
      called+=1
    end
    assert_equal 1, called
    assert_equal 0, status
  end
end
