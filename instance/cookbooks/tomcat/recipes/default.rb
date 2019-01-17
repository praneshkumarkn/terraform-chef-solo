#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update 'update'

apt_package 'default-jdk' do
  action :install
end

execute '' do
  command 'echo export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64 >>/root/.bashrc'
end

#group 'tomcat' do
#  group_name
#  action :create
#end


user 'tomcat' do
  manage_home true
  home '/home/tomcat'
  shell '/bin/bash'
  password 'tomcat'
  action :create
end

#group 'tomcat' do
#  action :modify
#  members 'tomcat'
#  append true
#end


#http_request 'download tomcat' do
#  url 'http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.5/bin/apache-tomcat-8.5.5.tar.gz'
#end

remote_file '/opt/apache-tomcat-7.0.92.tar.gz' do
  source 'http://mirrors.estointernet.in/apache/tomcat/tomcat-7/v7.0.92/bin/apache-tomcat-7.0.92.tar.gz'
  mode '0755'
  action :create
end

#tar_extract 'http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.5/bin/apache-tomcat-8.5.5.tar.gz' do
#  target_dir '/opt'
#  creates '/opt/apache-tomcat-8.5.5'
#  tar_flags [ '-P', '--strip-components 1' ]
#end

#execute 'extract_some_tar' do
#  command 'tar xzvf apache-tomcat-7.0.92.tar.gz'
#  cwd '/opt/'
#end

bash 'extract_module' do
  cwd '/opt'
  code <<-EOH
    tar xzvf apache-tomcat-7.0.92.tar.gz
    EOH
end


directory "/opt/apache-tomcat-7.0.92" do
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  recursive true
  action :create
end

cookbook_file '/opt/apache-tomcat-7.0.92/webapps/addressbook.war' do
  source 'addressbook.war'
  mode '0755'
  action :create
end



bash 'extract_module' do
  cwd '/opt/apache-tomcat-7.0.92'
  code <<-EOH
    sudo source /etc/environment
    sh /opt/apache-tomcat-7.0.92/bin/startup.sh
    EOH
end

#execute "" do
#  command "sh /opt/apache-tomcat-8.5.5/bin/startup.sh"
#end

#cookbook_file '/opt/apache-tomcat-8.5.5' do
#  source 'war'
#  owner 'web_admin'
#  group 'web_admin'
#  mode '0755'
#  action :create
#end

