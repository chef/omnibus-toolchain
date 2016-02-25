source 'https://rubygems.org'

gem 'omnibus',          github: 'opscode/omnibus'
gem 'omnibus-software', github: 'opscode/omnibus-software'
gem 'chef-sugar', '~> 3.3'
gem 'rubocop',    '=  0.23.0'

group :rake do
  gem 'rake'
  gem 'tomlrb'
end

group :development do
  gem 'test-kitchen',      github: 'test-kitchen/test-kitchen'
  gem 'kitchen-zone',      git: 'git@github.com:scotthain/kitchen-zone.git'
  gem 'kitchen-wpar',      git: 'git@github.com:chef/kitchen-wpar.git'
  gem 'kitchen-vagrant',   '~> 0.19'
  gem 'berkshelf',  '~> 4.0'
end
