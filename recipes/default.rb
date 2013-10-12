#
# Cookbook Name:: site-rbenv
# Recipe:: default
#

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

# install library packages that is required from ruby or gems
node[:site_rbenv][:lib_packages].each do |pkg|
  package pkg
end

# rbenv
GLOBAL_RUBY_VERSION = node[:site_rbenv][:global_ruby_version]
rbenv_ruby GLOBAL_RUBY_VERSION do
  ruby_version GLOBAL_RUBY_VERSION
  global true
end

node[:site_rbenv][:global_ruby_gems].each do |g|
  rbenv_gem g do
    ruby_version GLOBAL_RUBY_VERSION
  end
end

