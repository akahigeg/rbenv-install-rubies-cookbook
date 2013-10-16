#
# Cookbook Name:: site-rbenv
# Recipe:: default
#

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

# install library packages that is required from ruby or gems
node[:rbenv_install_rubies][:lib_packages].each do |pkg|
  package pkg
end

# rbenv
GLOBAL_RUBY_VERSION = node[:rbenv_install_rubies][:global_version]
OTHER_RUBY_VERSIONS = node[:rbenv_install_rubies][:other_versions]

rbenv_ruby GLOBAL_RUBY_VERSION do
  ruby_version GLOBAL_RUBY_VERSION
  global true
end

OTHER_RUBY_VERSIONS.each do |v|
  rbenv_ruby v do
    ruby_version v
  end
end

all_versions = OTHER_RUBY_VERSIONS + [GLOBAL_RUBY_VERSION]

all_versions.each do |v|
  node[:rbenv_install_rubies][:gems].each do |g|
    if g.is_a? Hash
      gem_name = g.keys.first
      rbenv_gem gem_name do
        ruby_version v
        version g[gem_name]["version"]
      end
    else
      rbenv_gem g do
        ruby_version v
      end
    end
  end
end

