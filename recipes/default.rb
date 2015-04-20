#
# Cookbook Name:: openbravo
# Recipe:: default
#
# Author :: Ganesan (<ganesan.a@cloudenablers.com>)
# Copyright 2015, Cloudenablers
#
# All rights reserved - Do Not Redistribute
#
include_recipe "java::default"
include_recipe "ant::default"
include_recipe "tomcat6::default"
include_recipe "postgresql::default"


remote_file "/opt/#{node[:openbravo][:pkg_name]}" do
source "http://sourceforge.net/projects/openbravo/files/02-openbravo-sources/3.0PR15Q1.1/#{node[:openbravo][:pkg_name]}/download"
end

bash "unpack_openbravo" do
code <<-EOH
cd /opt
tar -xjf #{node[:openbravo][:pkg_name]}
EOH
end


template "#{node['openbravo_core']['dir']}/Openbravo.properties" do
  source "Openbravo.properties"
  owner "tomcat"
  group "tomcat"
  mode 0644
  action :create_if_missing
end

template "#{node['openbravo_core']['dir']}/Format.xml" do
  source "Format.xml"
  owner "tomcat"
  group "tomcat"
  mode 0644
  action :create_if_missing
end

template "#{node['openbravo_core']['dir']}/userconfig.xml" do
  source "userconfig.xml"
  owner "tomcat"
  group "tomcat"
  mode 0644
  action :create_if_missing
end

template "#{node['openbravo_core']['dir']}/log4j.lcf" do
  source "log4j.lcf"
  owner "tomcat"
  group "tomcat"
  mode 0644
  action :create_if_missing
end



ruby_block "set-env-catalina-home" do
  block do
    opts = "\"-server -Djava.awt.headless=true -Xms256M -Xmx2048M -XX:MaxPermSize=256M\""
open('/etc/profile', 'a') { |f|
  f << " export CATALINA_HOME=/usr/share/tomcat6\n"
  f << " export CATALINA_BASE=/srv/tomcat6\n"
  f << " export CATALINA_OPTS=#{opts}\n"
  f << " export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64\n"
}
  end
end


#bash 'change_mode_tomcat' do
#  user "root"
#  code <<-EOH
#    chown tomcat:tomcat -R #{node['openbravo_core']['path']}
#EOH
#end


execute "Restart postgresql server" do
  user "root"
  command <<-EOF
       service postgresql restart
  EOF
end


execute "install with ant" do
  user "tomcat"
  command <<-EOF
       cd  #{node['openbravo_core']['path']}
       #{node['openbravo_core']['catalina_home']}
       #{node['openbravo_core']['catalina_base']}
       #{node['openbravo_core']['catalina_opts']}
       #{node['openbravo_core']['java_path']}
       ant install.source
       exit 
    EOF
end



execute "smartbuild with ant" do
  user "tomcat"
  command <<-EOF
       cd  #{node['openbravo_core']['path']}
       #{node['openbravo_core']['catalina_home']}
       #{node['openbravo_core']['catalina_base']}
       #{node['openbravo_core']['catalina_opts']}
       #{node['openbravo_core']['java_path']}
       ant smartbuild
       exit 
    EOF
end


service "tomcat6" do
  action :restart
end
