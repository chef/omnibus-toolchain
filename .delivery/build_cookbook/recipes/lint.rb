#
# Cookbook Name:: build_cookbook
# Recipe:: lint
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

gem_cache = File.join(node['delivery']['workspace']['root'], "../../../project_gem_cache")

ruby_execute 'Run chefstyle against Omnibus code' do
  version node['build_cookbook']['ruby_version']
  command 'bundle install --without development && bundle exec rake chefstyle'
  cwd delivery_workspace_repo
  environment('BUNDLE_PATH' => gem_cache)
end
