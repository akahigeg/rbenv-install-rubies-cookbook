Chef cookbook of ruby install by rbenv. Can specify ruby versions into node attributes.

# Depends

* [rbenv](https://github.com/RiotGames/rbenv-cookbook)

# Recipes

## default

Install rubyies that specified in node attributes.

## keep-group-write

To keep group write of rbenv versions directory for installing gems by rbenv group user.

# Attributes

Global ruby version.

    node.default[:rbenv_install_rubies][:global_version] = '2.0.0-p247'

List of other versions.

    node.default[:rbenv_install_rubies][:other_versions] = []

List of preinstalled gems for rubies.

    node.default[:rbenv_install_rubies][:gems] = ['bundler', 'rbenv-rehash', 'pry']

List of OS package names that is required by compiling ruby and some gems.

    node.default[:rbenv_install_rubies][:lib_packages] = []

# Sample json

## Just install rubies

    {
      "run_list": [
        "recipe[rbenv-install-rubies]"
      ],
      "rbenv-install-rubies": {
        "global_version": "2.0.0-p247",
        "other_versions": ["1.9.3-p448"],
        "gems": ["bundler", "rbenv-rehash", "pry", {"nokogiri" => {"version" => "1.5.10"}}],
        "lib_packages": ["libxml2-devel", "libxslt-devel"]
      }
    }

## With keep group write feature

    {
      "run_list": [
        "recipe[rbenv-install-rubies]"
        "recipe[rbenv-install-rubies::keep-group-write]"
      ],
      "rbenv": {
       "group_users": ["john", "mike"]
      ],
      "rbenv-install-rubies": {
        "global_version": "2.0.0-p247",
        "other_versions": ["1.9.3-p448"],
        "gems": ["bundler", "rbenv-rehash", "pry", {"nokogiri" => {"version" => "1.5.10"}}],
        "lib_packages": ["libxml2-devel", "libxslt-devel"]
      }
    }

# Specs

This cookbook is tested by below things.

* [serverspec](http://serverspec.org/)
* [Vagrant](http://www.vagrantup.com/)
* [Berkshelf](http://berkshelf.com/)

## How to run specs

    $ git clone https://github.com/akahigeg/rbenv-install-rubies-cookbook.git
    $ cd rbenv-install-rubies-cookbook
    $ vagrant up
    $ bundle install
    $ bundle exec rake spec