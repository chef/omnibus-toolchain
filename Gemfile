source 'https://rubygems.org'


gem 'omnibus',          git: 'https://github.com/chef/omnibus'

# The branch below contains:
# - bash 5.1: 5.0 was failing to compile due to missing bits.  Also changed it to delete bashbug instead of patching it out of the build
# - bzip2 patch that isn't required for macos.  Probalby we should find out why it's not patching on macos instead.
gem 'omnibus-software', git: 'https://github.com/chef/omnibus-software', branch: 'mp/temp-bzip2-arm-fix'

# locked this to > 3 because I had some local conflicts with 2.x installed (omnibus build failed to load)
gem 'mixlib-shellout', "> 3.0"

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
