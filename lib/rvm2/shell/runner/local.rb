require 'session'

class Rvm2::Shell::Runner::Local
  attr_reader :shell
  def initialize(shell = "sh")
    @shell = shell
  end
  def execute(command)
    shell_session.execute(command) do |out, err|
      yield(out, err)
    end
    shell_session.status
  end
  def shell_session
    @shell_session ||= Session::Sh.new(:prog => shell)
  end
end
