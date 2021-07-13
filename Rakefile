require "chefstyle"
require "rubocop/rake_task"
desc " Run ChefStyle"
RuboCop::RakeTask.new(:chefstyle) do |task|
  task.options << "--display-cop-names"
  task.options << "config"
end
