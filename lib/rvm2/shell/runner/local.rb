require 'session'

class Rvm2::Shell::Runner::Local
  attr_reader :shell
  def initialize(shell = "sh")
    @shell = shell
  end
  def execute(command)
    shell.execute(command) do |out, err|
      yield(out, err)
    end
  end
  def shell
    @shell ||= Session::Sh.new(:prog => shell)
  end
end
