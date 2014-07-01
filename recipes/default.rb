#
# Cookbook Name:: example_wrapper_cookbook
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# add another resource to resource collection before example_cookbook
file '/tmp/file1.txt'

include_recipe 'example_cookbook'

# example changes notifications of resource
# each resource has delayed_notifications and immediate_notifications
# http://rdoc.info/gems/chef/Chef/Resource
r1 = resources(template: node['lighttpd']['config_file'])
r1.delayed_notifications.each { |dn| r1.notifies_immediately(dn.action, dn.resource) }
r1.delayed_notifications.clear
# changing template source and cookbook
r1.source('alternative_index.html.erb')
r1.cookbook('example_wrapper_cookbook')

# add another resource to resource collection after example_cookbook
file '/tmp/file2.txt'

# change a resource's action to nothing so it doesn't execute
r2 = resources(template: File.join(node['lighttpd']['document_root'], 'index.html'))
r2.action(:nothing)

# change a directory's mode
r3 = resources(directory: node['lighttpd']['document_root'])
r3.mode(0700)

# if you're not sure if the resource exists
# you will need to rescue the exception
begin
  r4 = resources(service: 'non-existent')
  r4.service_name('snmpd')
  r4.action(:start)
rescue Chef::Exceptions::ResourceNotFound => e
  Chef::Log.warn(e.message)
end

# It does not matter what type of resource needs to be modified
# For example, look up the available methods for a service resource
# http://rdoc.info/gems/chef/Chef/Resource/Service
# Some are inherited as well
# http://rdoc.info/gems/chef/Chef/Resource
