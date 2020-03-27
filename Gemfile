source 'https://rubygems.org'

gem 'omnibus',          git: 'https://github.com/chef/omnibus'
# Here we pin to `jsinha/remove_dependencies` branch until it is merged to master as this branch removes rubygems
# and bundler installed as individual software gems since now they are included in ruby 2.6 and greater
# This branch helps with avoiding multiple installations of bunder pulled in by differed definitions
gem 'omnibus-software', git: 'https://github.com/chef/omnibus-software', branch: 'jsinha/remove_dependencies'
gem 'artifactory'

gem 'chefstyle'

group :rake do
  gem 'rake'
  gem 'tomlrb'
end

group :development do
  gem 'test-kitchen'
  gem 'winrm-fs'
  gem 'kitchen-zone'
  gem 'kitchen-vagrant'
end
