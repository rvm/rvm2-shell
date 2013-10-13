class Rvm2::Shell::Command::Base
  attr_reader :status, :command

  def initialize(*args)
    @command = args
  end

  def start
    @started = Time.now
  end

  def finish(status)
    @finished = Time.now
    @status   = status
  end

  def duration
    return nil if @started.nil? || @finished.nil?
    @finished - @started
  end

  def execute(runner)
    start
    status = runner.execute(to_s)
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
    args.map{|a| "\"#{a}\""}.join(" ")
  end
end
