Chef cookbook of rbenv configure for your site.

depends on [rbenv cookbook](https://github.com/RiotGames/rbenv-cookbook)

## Attributes

    node.default[:site_rbenv][:global_ruby_version] = '2.0.0-p247'

Specify global ruby version.

    node.default[:site_rbenv][:global_ruby_gems] = ['bundler']

List preinstalled gems for global ruby.

    node.default[:site_rbenv][:lib_packages] = []

List OS package names that is required by compiling ruby and some gems.

## Sample json

    {
      "run_list": [
        "recipe[site-rbenv]"
      ],
      "site_rbenv": {
        "global_ruby_version": "2.0.0-p247",
        "global_ruby_gems": ["bundler", "rbenv-rehash"],
        "lib_packages": ["libxml2-devel", "libxslt-devel", "openssl-devel"]
      }
    }

