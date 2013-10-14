task :test do
  $LOAD_PATH.unshift('lib', 'test')
  Dir.glob('./test/**/*_test.rb') { |f| require f }
end

task :yard do
  at_exit {
    require 'yard'
    require 'yard/cli/yardoc'
    require 'yard/cli/stats'
    YARD::CLI::Yardoc.new.run("--no-stats", "lib/**/*.rb")
    YARD::CLI::Stats.new.run("--list-undoc", "--compact")
  }
end

# reversed order for at_exit
task :default => [:yard, :test]
