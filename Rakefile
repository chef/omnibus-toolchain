require "rspec/core/rake_task"

require_relative "tasks/maintainers"

namespace :style do
  require "rubocop/rake_task"
  desc "Run Ruby style checks"
  RuboCop::RakeTask.new(:ruby)
end

desc "Run all style checks"
task style: ["style:ruby"]

# The default rake task should just run it all
task default: ["style:ruby"]
