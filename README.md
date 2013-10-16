Chef cookbook of rbenv configure for your site.

## Depends

* [rbenv cookbook](https://github.com/RiotGames/rbenv-cookbook)

## Recipes

### default

Install rubyies

### keep-group-write

To keep group write of rbenv version directories for installing gems by rbenv group user.

## Attributes

    node.default[:rbenv_install_rubies][:global_version] = '2.0.0-p247'

Specify global ruby version.

    node.default[:rbenv_install_rubies][:other_versions] = []

Specify other versions.

    node.default[:rbenv_install_rubies][:gems] = ['bundler', 'rbenv-rehash', 'pry']

List of preinstalled gems for global ruby.

    node.default[:rbenv_install_rubies][:lib_packages] = []

List of OS package names that is required by compiling ruby and some gems.

## Sample json

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
