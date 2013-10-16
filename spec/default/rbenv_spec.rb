require 'spec_helper'

# see also chef.json section in Vagrantfile

# rbenv
describe group('rbenv') do
  it { should exist }
end

describe user('rbenv') do
  it { should exist }
end

describe user('vagrant') do
  it { should exist }
  it { should belong_to_group 'rbenv' }
end

describe file('/opt/rbenv') do
  it { should be_directory }
  it { should be_owned_by 'rbenv' }
  it { should be_grouped_into 'rbenv' }
end

# ruby versions
describe file('/opt/rbenv/versions/2.0.0-p247') do
  it { should be_directory }
end

# global
describe command('ruby -v') do
  let(:path) { '/opt/rbenv/shims' }
  it { should return_stdout 'ruby 2.0.0p247 (2013-06-27 revision 41674) [i686-linux]' }
end

describe file('/opt/rbenv/versions/1.9.3-p448') do
  it { should be_directory }
end

# gem
describe package('bundler') do
  let(:path) { '/opt/rbenv/shims' }
  it { should be_installed.by('gem') }
end

describe package('pry') do
  let(:path) { '/opt/rbenv/shims' }
  it { should be_installed.by('gem') }
end

describe package('rbenv-rehash') do
  let(:path) { '/opt/rbenv/shims' }
  it { should be_installed.by('gem') }
end

describe package('nokogiri') do
  let(:path) { '/opt/rbenv/shims' }
  it { should be_installed.by('gem').with_version('1.5.10') }
end

# lib_packages
describe package('libxml2-devel') do
  it { should be_installed }
end

describe package('libxslt-devel') do
  it { should be_installed }
end

# keep group write
describe file('/opt/rbenv/versions/2.0.0-p247') do
  it { should be_writable.by('group') }
end

describe cron do
  it { should have_entry '* * * * * chown -R rbenv:rbenv /opt/rbenv/versions' }
  it { should have_entry '* * * * * chmod g+w -R /opt/rbenv/versions' }
end
