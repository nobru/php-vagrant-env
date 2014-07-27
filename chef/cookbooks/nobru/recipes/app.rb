include_recipe 'mysql::server'
include_recipe 'mysql::client'
include_recipe 'php'
include_recipe 'php-fpm'
include_recipe 'nginx'

begin
  t = resources("template[#{node['nginx']['dir']}/sites-available/default]")
  t.source "default.conf.erb"
  t.cookbook "nobru"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "could not find template your template override!"
end

template "/etc/init.d/php5-fpm" do
    source 'php5-fpm.erb'
    cookbook 'nobru'
    unless platform?('windows')
        owner 'root'
        group 'root'
        mode '0755'
    end
end