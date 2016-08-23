#
# Cookbook Name:: build_cookbook
# Recipe:: publish
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#########################################################################
# TODO: set these things in `delivery-bus`
#########################################################################
delivery_bus_secrets = DeliverySugar::ChefServer.new.encrypted_data_bag_item('delivery-bus', 'secrets')

node.set['jenkins']['master']['endpoint']  = 'http://manhattan.ci.chef.co'
node.set['jenkins']['executor']['timeout'] = 7200 # wait up to 2 hours for jobs to complete
node.run_state[:jenkins_private_key]       = delivery_bus_secrets['jenkins_private_key']

node['build_cookbook']['toolchain_projects'].each do |toolchain_project|

  #########################################################################
  # Execute the build in Jenkins. The `jenkins_job` resource will block
  # until completion AND stream back log output into the current CCR.
  #########################################################################
  jenkins_job toolchain_project do
    parameters(
      'GIT_REF' => node['delivery']['change']['sha'], # TODO: expose the change SHA in delivery-sugar,
      'APPEND_TIMESTAMP' => 'false', # ensure we don't append a timestamp to our build version
      'DELIVERY_CHANGE' => delivery_change_id,
      'DELIVERY_SHA' => node['delivery']['change']['sha'],
    )
    action :build
  end

end
