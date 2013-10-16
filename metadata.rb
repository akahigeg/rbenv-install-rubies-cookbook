name             "rbenv-install-rubies"
maintainer       "akahigeg"
maintainer_email "akahigeg@gmail.com"
license          "MIT"
description      "Install ruby by using rbenv"
version          "0.2.1"
depends          "rbenv"

recipe "rbenv-install-rubies::default", "Install rubyies that specified in node attributes."
recipe "rbenv-install-rubies::keep-group-write", "To keep group write of rbenv versions directory for installing gems by rbenv group user."

%w{ centos redhat fedora ubuntu debian amazon oracle}.each do |os|
  supports os
end