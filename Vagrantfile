Vagrant.configure("2") do |config|
  config.vm.hostname = "rbenv-install-rubies-berkshelf"
  config.vm.box      = "centos64"
  config.vm.box_url  = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-i386-v20130731.box"

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      "rbenv" => {
        "group_users" => ["vagrant"]
      },
      "rbenv_install_rubies" => {
        "global_version" => "2.0.0-p247",
        "other_versions" => ["1.9.3-p448"],
        "gems" => ["bundler", "pry", "rbenv-rehash", {"nokogiri" => {"version" => "1.5.10"}}],
        "lib_packages" => ["libxml2-devel", "libxslt-devel"]
      },
    }

    chef.run_list = [
      "recipe[rbenv-install-rubies]",
      "recipe[rbenv-install-rubies::keep-group-write]"
    ]
  end
end
