source 'https://rubygems.org'

#gem 'omnibus',          git: 'https://github.com/chef/omnibus'
#gem 'omnibus-software', git: 'https://github.com/chef/omnibus-software'
gem 'omnibus',          path: './omnibus'
gem 'omnibus-software', path: './omnibus-software'

gem 'chefstyle', '~> 0.3'

# Fork to allow for a recent version of multipart-post.
gem "pedump", git: "https://github.com/ksubrama/pedump", branch: "patch-1"

group :rake do
  gem 'rake'
  gem 'tomlrb'
end

group :development do
  gem 'test-kitchen'
  gem 'winrm-fs'
  gem 'kitchen-zone',      path: './kitchen-zone'
  gem 'kitchen-vagrant',   '~> 0.19'
  gem 'berkshelf',  '~> 4.0'
end
