require 'hooks'
require 'hooks/instance_hooks'

class Rvm2::Shell::Command::Executor
  include Hooks
  include Hooks::InstanceHooks

  define_hook  :on_start, halts_on_falsey: true
  define_hooks :on_stdout, :on_stderr, :on_finish

  attr_reader :status, :command

  def initialize(command)
    @command = command
  end

  def start
    @started = Time.now
    run_hook(:on_start, @started)
  end

  def finish(status)
    @finished = Time.now
    @status   = status
    run_hook(:on_finish, @finished, @status)
    @status
  end

  def duration
    return nil if @started.nil? || @finished.nil?
    @finished - @started
  end

  def execute(runner)
    start
    status = runner.execute(to_s) do |out, err|
      run_hook(:on_stdout, out) if out
      run_hook(:on_stderr, err) if err
    end
  ensure
    finish(status) # nil if not called
  end

  def aborted?
    @status.nil?
  end

  def success?
    @status == 0
  end

  def failed?
    !aborted? && !success?
  end

  def to_s
    command
  end

end
