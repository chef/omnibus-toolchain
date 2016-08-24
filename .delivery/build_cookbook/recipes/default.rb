#
# Cookbook Name:: build_cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Ensure Java is installed for remote triggering of Jenkins jobs with `jenkins_job`
include_recipe 'java::default'
