#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
node.default['apache']['dir']          = '/home/ubuntu/apache2'
node.default['apache']['dir1']          = '/home/ubuntu/apache2'

package "apache2" do
  action :install
end

service "apache2" do
  action :restart
end

execute 'a2enmod' do
  command 'sudo /usr/sbin/a2enmod proxy_http'
end

template "/etc/apache2/sites-available/000-default.conf" do
 source "vhost.erb"
 action :create
 notifies :restart, resources(:service => "apache2")
end

directory node['apache']['dir'] do
 owner 'www-data'
 group 'www-data'
 mode '0644'
 action :create
end

cookbook_file "#{node['apache']['dir']}/index.html" do
 source 'index.html'
 owner 'www-data'
 group 'www-data'
 action :create
end

#template "#{node['apache']['dir']}/sites-available/000-default.conf" do
# source "vhost.erb"
# variables({ :doc_root => node['apache']['dir1'] })
# action :create
# notifies :restart, resources(:service => "apache2")
#end

