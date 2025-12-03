source 'https://rubygems.org'

gem "omnibus", github: ENV.fetch("OMNIBUS_GITHUB_REPO", "chef/omnibus"), branch: ENV.fetch("OMNIBUS_GITHUB_BRANCH", "CHEF-27997-add-el-9-to-packagers-rpm-file-omnibus-repo/muthuja")
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
end
