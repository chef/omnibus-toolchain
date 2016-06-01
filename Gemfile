source 'https://rubygems.org'

gem 'omnibus',          github: 'chef/omnibus'
gem 'omnibus-software', github: 'chef/omnibus-software', branch: "jsinha/add_licensing"

gem 'rubocop',    '=  0.23.0'

group :rake do
  gem 'rake'
  gem 'tomlrb'
end

group :development do
  gem 'test-kitchen',      github: 'test-kitchen/test-kitchen'
  gem 'kitchen-zone',      git: 'git@github.com:scotthain/kitchen-zone.git'
  gem 'kitchen-vagrant',   '~> 0.19'
  gem 'berkshelf',  '~> 4.0'
end
