#
# Cookbook Name:: chef-server
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package_name = node['chef-server']['file']
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"

# transfer RPM to remote
cookbook_file package_local_path do
    source package_name
    action :create_if_missing
end

# install RPM
rpm_package package_name do
    source package_local_path
    notifies :run, 'execute[chef-server-ctl reconfigure]', :immediately
end

# reconfigure the installation
execute 'chef-server-ctl reconfigure' do
    command 'chef-server-ctl reconfigure'
    action :nothing
end
