#
# Cookbook Name:: build_cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#########################################################################
# Install Ruby for testing and linting
#########################################################################
ruby_install node['build_cookbook']['ruby_version']

# get to the project root and use it as a cache
# as it is persistent between build jobs
gem_cache = File.join(node['delivery']['workspace']['root'], "../../../project_gem_cache")

directory gem_cache do
  # set the owner to the dbuild so that the other recipes can write to here
  owner node['delivery_builder']['build_user']
  mode '0755'
  recursive true
  action :create
end

#########################################################################
# Ensure Java is installed for remote triggering of Jenkins jobs with
# `jenkins_job`
#########################################################################
include_recipe 'java::default'
