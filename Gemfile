source 'https://rubygems.org'

gem "omnibus", github: ENV.fetch("OMNIBUS_GITHUB_REPO", "chef/omnibus"), branch: ENV.fetch("OMNIBUS_GITHUB_BRANCH", "main")
gem "omnibus-software", github: ENV.fetch("OMNIBUS_SOFTWARE_GITHUB_REPO", "chef/omnibus-software"), branch: ENV.fetch("OMNIBUS_SOFTWARE_GITHUB_BRANCH", "main")
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
  gem 'ohai', '~> 17.7'   #pin ohai to 16.17.0
end
