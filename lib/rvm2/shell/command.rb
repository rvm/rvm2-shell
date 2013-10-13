module Rvm2::Shell::Command
  def build(*args)
    # TODO: find a plugin to handle special cases
    Base.new(args)
  end
end

require_relative "command/base"
