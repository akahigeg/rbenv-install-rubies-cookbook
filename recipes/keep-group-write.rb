#
# Cookbook Name:: rbenv-install-rubies
# Recipe:: keep-group-write
#

include_recipe "rbenv::default"

versions_dir = "#{node[:rbenv][:root]}/versions"
versions = [node[:rbenv_install_rubies][:global_version]] + node[:rbenv_install_rubies][:other_versions]

keep_owner_command = "chown -R #{node[:rbenv][:user]}:#{node[:rbenv][:group]} #{versions_dir}"
keep_group_write_command = "chmod g+w -R #{versions_dir}"

# cron
cron "keep_rbenv_versions_owner" do
  command keep_owner_command
end

cron "keep_rbenv_versions_group_write" do
  command keep_group_write_command
end

# initialize owner and permission
execute "exec_keep_owner_command" do
  command keep_owner_command
end

execute "exec_keep_group_write_command" do
  command keep_group_write_command
end
