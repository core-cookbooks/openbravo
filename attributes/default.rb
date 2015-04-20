#
# Cookbook Name:: openbravo
# Attributes:: default
#
# Author :: Ganesan (<ganesan.a@cloudenablers.com>)
# Copyright 2015, Cloudenablers
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.



set[:openbravo][:pkg_name] = "openbravo-3.0PR15Q1.1.tar.bz2"
set[:openbravo][:pkg_ext] = "openbravo3.tar.bz2"
default['openbravo_core']['name'] = "Openbravo-3.0PR15Q1.1"
default['openbravo_core']['dir'] = "/opt/#{node['openbravo_core']['name']}/config"
default['openbravo_core']['path'] = "/opt/#{node['openbravo_core']['name']}"
default['openbravo]']['config_root'] = "#{node['openbravo_core']['dir']}/Openbravo.properties"
default['openbravo_core']['java_path'] = "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64"
default['openbravo_core']['catalina_home'] = "export CATALINA_HOME=/usr/share/tomcat6"
default['openbravo_core']['catalina_base'] = "export CATALINA_BASE=/srv/tomcat6"
default['opts'] = "\"-server -Djava.awt.headless=true -Xms256M -Xmx2048M -XX:MaxPermSize=256M\""
default['openbravo_core']['catalina_opts'] = "export CATALINA_OPTS=#{node['opts']}"
default['postgresql']['postgres_role_pwd'] = 'postgres'
default['postgresql']['tad_role_pwd'] = 'tad'
default['postgresql']['db_server'] = '192.168.1.151'


