source 'https://rubygems.org'

gem 'omnibus',          git: 'https://github.com/chef/omnibus'
gem 'omnibus-software', git: 'https://github.com/chef/omnibus-software', branch: 'shain/disable_curl_alpn_on_aix'

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
  gem 'kitchen-zone'
  gem 'kitchen-vagrant',   '~> 0.19'
  gem 'berkshelf',  '~> 4.0'
end
