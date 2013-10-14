require 'test_helper'
require 'rvm2/shell/runner/ssh'
require 'etc'

enable_ssh_test =
begin
  Net::SSH.start("localhost", Etc.getlogin).close
  true
rescue Exception => e
  puts "Disabling SSH runner test because: #{e}"
  false
end

class Rvm2::Shell::Runner::TestSsh < MiniTest::Unit::TestCase
  def setup
    @test = Rvm2::Shell::Runner::Ssh
  end

  def test_true
    test_command = "true"
    local = @test.new("localhost", Etc.getlogin)
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
    local = @test.new("localhost", Etc.getlogin)
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
    local = @test.new("localhost", Etc.getlogin)
    called = 0
    status =
    local.execute(test_command) do |out, err|
      assert_equal out.strip, "test"
      assert_equal err, nil
      called+=1
    end
    assert_equal 1, called
    assert_equal 0, status
  end
end if enable_ssh_test
